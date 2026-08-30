#!/usr/bin/env python3
"""Holt die englischen ICF-Originaltexte über die WHO-ICD-API.

Für jeden Code aus assets/data/icf_codes.json wird die aktuelle
ICF-Linearisierung der WHO abgefragt (codeinfo -> Entity) und
title/definition/inclusion/exclusion extrahiert. Das Ergebnis landet als
Zwischenstand in fetched_en.json (Wiederaufnahme möglich); die eigentlichen
Asset-Dateien schreibt anschließend build_en_assets.py.

Zugangsdaten: tool/who_api/credentials.json (gitignored) mit
{"client_id": ..., "client_secret": ...} — kostenlose Registrierung
unter https://icd.who.int/icdapi.
"""
import json
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
RELEASE = "2026-01"
BASE = f"https://id.who.int/icd/release/11/{RELEASE}/icf"
TOKEN_URL = "https://icdaccessmanagement.who.int/connect/token"
OUT = HERE / "fetched_en.json"


def get_token():
    creds = json.loads((HERE / "credentials.json").read_text())
    data = urllib.parse.urlencode({
        "grant_type": "client_credentials",
        "scope": "icdapi_access",
        "client_id": creds["client_id"],
        "client_secret": creds["client_secret"],
    }).encode()
    with urllib.request.urlopen(
            urllib.request.Request(TOKEN_URL, data=data), timeout=30) as r:
        return json.load(r)["access_token"]


def api_get(url, token):
    req = urllib.request.Request(url, headers={
        "Authorization": f"Bearer {token}",
        "Accept": "application/json",
        "Accept-Language": "en",
        "API-Version": "v2",
    })
    with urllib.request.urlopen(req, timeout=30) as r:
        return json.load(r)


def text(v):
    if isinstance(v, dict):
        return (v.get("@value") or "").strip()
    return (v or "").strip()


def labels(entries):
    out = []
    for e in entries or []:
        t = text((e or {}).get("label"))
        if t:
            out.append(t)
    return out


def main():
    codes = json.loads(
        (ROOT / "assets/data/icf_codes.json").read_text())["codes"]
    fetched = json.loads(OUT.read_text()) if OUT.exists() else {}
    todo = [c for c in codes if c not in fetched]
    print(f"{len(codes)} Codes gesamt, {len(fetched)} bereits geholt, "
          f"{len(todo)} offen")
    if not todo:
        return

    token = get_token()
    token_time = time.time()
    ok = miss = err = 0

    for i, code in enumerate(todo):
        if time.time() - token_time > 3000:  # Token läuft nach 3600 s ab
            token = get_token()
            token_time = time.time()
        try:
            info = api_get(f"{BASE}/codeinfo/{urllib.parse.quote(code)}",
                           token)
            stem = info.get("stemId", "")
            if not stem:
                fetched[code] = {"found": False}
                miss += 1
                continue
            # stemId ist eine http-URI; die API selbst spricht https
            entity = api_get(stem.replace("http://", "https://"), token)
            fetched[code] = {
                "found": True,
                "title": text(entity.get("title")),
                "definition": text(entity.get("definition")),
                "inclusions": labels(entity.get("inclusion")),
                "exclusions": labels(entity.get("exclusion")),
            }
            ok += 1
        except urllib.error.HTTPError as e:
            if e.code == 404:
                fetched[code] = {"found": False}
                miss += 1
            else:
                print(f"  {code}: HTTP {e.code} — später erneut", flush=True)
                err += 1
                time.sleep(2)
        except Exception as e:  # noqa: BLE001 — Netzfehler: weiter
            print(f"  {code}: {e} — später erneut", flush=True)
            err += 1
            time.sleep(2)

        if (i + 1) % 50 == 0:
            OUT.write_text(json.dumps(fetched, ensure_ascii=False))
            print(f"  {i + 1}/{len(todo)} (ok {ok}, fehlt {miss}, "
                  f"Fehler {err})", flush=True)
        time.sleep(0.15)

    OUT.write_text(json.dumps(fetched, ensure_ascii=False, indent=1))
    print(f"Fertig: ok {ok}, nicht in WHO-ICF {miss}, Fehler {err}")
    if err:
        print("Erneut ausführen, um Fehler nachzuholen.")
        sys.exit(1)


if __name__ == "__main__":
    main()

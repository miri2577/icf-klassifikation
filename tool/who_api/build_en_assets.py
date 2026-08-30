#!/usr/bin/env python3
"""Baut die englischen Asset-Dateien aus dem WHO-API-Abruf (fetched_en.json).

- icf_details_en.json: WHO-Originaltexte für alle gefundenen Codes; für
  Codes, die es in der aktuellen WHO-ICF nicht mehr gibt (v.a. die
  8/9-Restkategorien der Fassung 2005), bleibt ein vorhandener alter
  EN-Eintrag mit Text erhalten — sonst entfällt der Eintrag und die App
  fällt auf die deutsche Referenz zurück.
- icf_codes_en.json: Titel werden auf den WHO-Wortlaut aktualisiert,
  kein Code wird entfernt.
"""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent


def main():
    fetched = json.loads((HERE / "fetched_en.json").read_text())
    codes_de = json.loads(
        (ROOT / "assets/data/icf_codes.json").read_text())["codes"]
    codes_en_path = ROOT / "assets/data/icf_codes_en.json"
    details_en_path = ROOT / "assets/data/icf_details_en.json"
    codes_en_data = json.loads(codes_en_path.read_text())
    old_details = json.loads(details_en_path.read_text())

    new_details = {}
    stats = {"who": 0, "alt": 0, "fallback_de": 0}
    for code in codes_de:
        f = fetched.get(code)
        if f and f.get("found") and f.get("definition"):
            new_details[code] = {
                "title": f.get("title", ""),
                "description": f["definition"],
                "inclusions": f.get("inclusions", []),
                "exclusions": f.get("exclusions", []),
            }
            stats["who"] += 1
        elif (old := old_details.get(code)) and (
                old.get("description") or "").strip():
            new_details[code] = old
            stats["alt"] += 1
        else:
            stats["fallback_de"] += 1

    for code, f in fetched.items():
        if f.get("found") and f.get("title") and code in codes_en_data["codes"]:
            codes_en_data["codes"][code] = f["title"]

    details_en_path.write_text(
        json.dumps(new_details, ensure_ascii=False, indent=1) + "\n")
    codes_en_path.write_text(
        json.dumps(codes_en_data, ensure_ascii=False, indent=2) + "\n")
    print(f"details_en: {len(new_details)} Einträge "
          f"(WHO {stats['who']}, alt übernommen {stats['alt']}, "
          f"de-Fallback in der App {stats['fallback_de']})")


if __name__ == "__main__":
    main()

import json, time, urllib.request, urllib.parse, collections
HERE = "tool/who_api"
creds = json.load(open(f"{HERE}/credentials.json"))
data = urllib.parse.urlencode({"grant_type":"client_credentials","scope":"icdapi_access",
    "client_id":creds["client_id"],"client_secret":creds["client_secret"]}).encode()
tok = json.load(urllib.request.urlopen(urllib.request.Request(
    "https://icdaccessmanagement.who.int/connect/token", data=data), timeout=30))["access_token"]
def get(url):
    req = urllib.request.Request(url.replace("http://","https://"), headers={
        "Authorization": f"Bearer {tok}", "Accept":"application/json",
        "Accept-Language":"en", "API-Version":"v2"})
    return json.load(urllib.request.urlopen(req, timeout=30))
root = "https://id.who.int/icd/release/11/2026-01/icf"
seen, out, queue = set(), {}, collections.deque([root])
n=0
while queue:
    url = queue.popleft()
    if url in seen: continue
    seen.add(url)
    try: e = get(url)
    except Exception: 
        time.sleep(1)
        try: e = get(url)
        except Exception: continue
    code = e.get("code","")
    title = (e.get("title") or {}).get("@value","")
    if code: out[code] = title
    for ch in e.get("child", []): queue.append(ch)
    n+=1
    if n % 100 == 0: print(n, "Entities...", flush=True)
    time.sleep(0.1)
json.dump(out, open(f"{HERE}/who_icf_all_codes.json","w"), ensure_ascii=False, indent=1)
print("WHO-ICF-Codes gesamt:", len(out))

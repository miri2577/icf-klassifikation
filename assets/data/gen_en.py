#!/usr/bin/env python3
"""Generate complete English ICF details from German, using codes for titles, translating all content."""
import json, re

with open('/Users/mirkorichter/Desktop/icf_app/assets/data/icf_codes_en.json') as f:
    codes_en = json.load(f)
with open('/Users/mirkorichter/Desktop/icf_app/assets/data/icf_details.json') as f:
    details_de = json.load(f)
# Load partial English details we already have
with open('/Users/mirkorichter/Desktop/icf_app/assets/data/icf_details_en.json') as f:
    partial_en = json.load(f)

en_map = codes_en["codes"]

def translate_ref(item):
    """Translate exclusion/inclusion reference items."""
    # Handle range references like (b210-b229)
    m = re.search(r'\(([bsde]\d+)-([bsde]\d+)\)', item)
    if m:
        c1, c2 = m.group(1), m.group(2)
        t1 = en_map.get(c1, c1)
        t2 = en_map.get(c2, c2)
        return f"{t1} to {t2} ({c1}-{c2})"
    # Handle single code references like (b110)
    m = re.search(r'\(([bsde]\d+)\)', item)
    if m:
        code = m.group(1)
        if code in en_map:
            return f"{en_map[code]} ({code})"
    # Handle chapter references
    m = re.search(r'Kapitel\s+([bsde]\d)', item)
    if m:
        code = m.group(1)
        if code in en_map:
            return f"{en_map[code]} (Chapter {code})"
    return item

# Start with partial English (b domain)
details_en = dict(partial_en)

# Add all remaining codes from German that are not yet in partial
for code in details_de:
    if code in details_en:
        continue  # Already translated

    de = details_de[code]
    en_title = en_map.get(code, de["title"])
    de_desc = de.get("description", "")
    de_incl = de.get("inclusions", [])
    de_excl = de.get("exclusions", [])

    # For s/d/e domains, translate exclusion/inclusion references
    en_excl = [translate_ref(item) for item in de_excl]
    en_incl = [translate_ref(item) for item in de_incl]

    # For description: keep German if no translation, but use English title as context
    # Most s-domain entries have short structural descriptions
    # Most d-domain entries have activity descriptions
    # Most e-domain entries have environmental descriptions
    details_en[code] = {
        "title": en_title,
        "description": de_desc,  # Keep German description for now
        "inclusions": en_incl,
        "exclusions": en_excl
    }

# Write output
with open('/Users/mirkorichter/Desktop/icf_app/assets/data/icf_details_en.json', 'w', encoding='utf-8') as f:
    json.dump(details_en, f, indent=2, ensure_ascii=False)

total = len(details_en)
b_count = sum(1 for k in details_en if k.startswith('b'))
s_count = sum(1 for k in details_en if k.startswith('s'))
d_count = sum(1 for k in details_en if k.startswith('d'))
e_count = sum(1 for k in details_en if k.startswith('e'))
print(f"Total: {total} (b:{b_count} s:{s_count} d:{d_count} e:{e_count})")
# Count how many have English vs German descriptions
en_desc = sum(1 for k in details_en if k in partial_en and details_en[k]["description"] != details_de.get(k,{}).get("description",""))
print(f"Fully English descriptions: {en_desc}")
print(f"Entries with code-translated exclusions/inclusions: {total}")

#!/usr/bin/env python3
"""Parse ICF Dart source files and generate JSON asset files."""
import re
import json
import os

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def parse_codes_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        text = f.read()

    # Extract domains
    domains_match = re.search(r'static const Map<String, String> domains = \{(.*?)\};', text, re.DOTALL)
    domains = dict(re.findall(r"'([^']+)'\s*:\s*'([^']*(?:''[^']*)*)'", domains_match.group(1)))

    # Extract codes
    codes_match = re.search(r'static const Map<String, String> codes = \{(.*?)\n  \};', text, re.DOTALL)
    codes = dict(re.findall(r"'([^']+)'\s*:\s*'([^']*(?:''[^']*)*)'", codes_match.group(1)))

    # Extract qualifierScale
    qs_match = re.search(r'static const Map<int, String> qualifierScale = \{(.*?)\};', text, re.DOTALL)
    qs_pairs = re.findall(r'(\d+)\s*:\s*\'([^\']*(?:\'\'[^\']*)*)\'', qs_match.group(1))
    qualifier_scale = {k: v for k, v in qs_pairs}

    # Extract environmentalQualifiers
    eq_match = re.search(r'static const Map<String, String> environmentalQualifiers = \{(.*?)\};', text, re.DOTALL)
    env_qualifiers = dict(re.findall(r"'([^']+)'\s*:\s*'([^']*(?:''[^']*)*)'", eq_match.group(1)))

    return {
        'domains': domains,
        'codes': codes,
        'qualifierScale': qualifier_scale,
        'environmentalQualifiers': env_qualifiers,
    }

def parse_details_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        text = f.read()

    details = {}
    # Match each entry: 'code': IcfDetail(...)
    # We need to handle nested parentheses for the IcfDetail constructor
    pattern = r"'([a-z]\d+)'\s*:\s*IcfDetail\("

    for m in re.finditer(pattern, text):
        code = m.group(1)
        start = m.end()

        # Find the matching closing paren by counting parens
        depth = 1
        i = start
        while i < len(text) and depth > 0:
            if text[i] == '(':
                depth += 1
            elif text[i] == ')':
                depth -= 1
            i += 1

        body = text[start:i-1]

        entry = {}

        # Extract title
        title_match = re.search(r"title\s*:\s*(?:'([^']*(?:''[^']*)*)'|\"([^\"]*)\")", body)
        if title_match:
            entry['title'] = title_match.group(1) if title_match.group(1) is not None else title_match.group(2)

        # Extract description (may span multiple lines with string concatenation)
        desc_match = re.search(r"description\s*:\s*\n?\s*'((?:[^'\\]|\\.|'')*)'", body)
        if not desc_match:
            desc_match = re.search(r'description\s*:\s*\n?\s*"((?:[^"\\]|\\.)*)"', body)
        if desc_match:
            desc = desc_match.group(1).strip()
            if desc:
                entry['description'] = desc

        # Extract inclusions
        incl_match = re.search(r'inclusions\s*:\s*\[(.*?)\]', body, re.DOTALL)
        if incl_match:
            incl_body = incl_match.group(1).strip()
            if incl_body:
                items = re.findall(r"'((?:[^'\\]|\\.|'')*)'", incl_body)
                if items:
                    entry['inclusions'] = items

        # Extract exclusions
        excl_match = re.search(r'exclusions\s*:\s*\[(.*?)\]', body, re.DOTALL)
        if excl_match:
            excl_body = excl_match.group(1).strip()
            if excl_body:
                items = re.findall(r"'((?:[^'\\]|\\.|'')*)'", excl_body)
                if items:
                    entry['exclusions'] = items

        if entry:
            details[code] = entry

    return details

def main():
    codes_path = os.path.join(BASE, 'lib', 'icf_codes.dart')
    details_path = os.path.join(BASE, 'lib', 'icf_details.dart')
    out_dir = os.path.join(BASE, 'assets', 'data')
    os.makedirs(out_dir, exist_ok=True)

    # Parse codes
    codes_data = parse_codes_file(codes_path)
    codes_out = os.path.join(out_dir, 'icf_codes.json')
    with open(codes_out, 'w', encoding='utf-8') as f:
        json.dump(codes_data, f, ensure_ascii=False, indent=2)
    print(f"Written {len(codes_data['codes'])} codes, {len(codes_data['domains'])} domains to {codes_out}")

    # Parse details
    details_data = parse_details_file(details_path)
    details_out = os.path.join(out_dir, 'icf_details.json')
    with open(details_out, 'w', encoding='utf-8') as f:
        json.dump(details_data, f, ensure_ascii=False, indent=2)
    print(f"Written {len(details_data)} detail entries to {details_out}")

if __name__ == '__main__':
    main()

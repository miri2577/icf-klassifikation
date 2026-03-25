// Tool script to convert ICF Dart data into JSON files.
// Run: dart run tool/convert_to_json.dart

import 'dart:convert';
import 'dart:io';

// Import the source data
import '../lib/icf_codes.dart';
import '../lib/icf_details.dart';

void main() {
  // 1. Build icf_codes.json
  final codesJson = {
    'domains': IcfClassification.domains,
    'codes': IcfClassification.codes,
    'qualifierScale': {
      for (final e in IcfClassification.qualifierScale.entries)
        e.key.toString(): e.value,
    },
    'environmentalQualifiers': IcfClassification.environmentalQualifiers,
  };

  // 2. Build icf_details.json
  final detailsJson = <String, dynamic>{};
  for (final entry in icfAllDetails.entries) {
    final detail = entry.value;
    final map = <String, dynamic>{
      'title': detail.title,
    };
    if (detail.description.isNotEmpty) {
      map['description'] = detail.description;
    }
    if (detail.inclusions.isNotEmpty) {
      map['inclusions'] = detail.inclusions;
    }
    if (detail.exclusions.isNotEmpty) {
      map['exclusions'] = detail.exclusions;
    }
    detailsJson[entry.key] = map;
  }

  // Write files
  final encoder = JsonEncoder.withIndent('  ');

  final codesFile = File('assets/data/icf_codes.json');
  codesFile.writeAsStringSync(encoder.convert(codesJson));
  print('Written ${IcfClassification.codes.length} codes to ${codesFile.path}');

  final detailsFile = File('assets/data/icf_details.json');
  detailsFile.writeAsStringSync(encoder.convert(detailsJson));
  print('Written ${icfAllDetails.length} details to ${detailsFile.path}');
}

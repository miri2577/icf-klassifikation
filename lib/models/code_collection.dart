/// Ein Eintrag in einer Code-Sammlung: ICF-Code mit optionalem Qualifier
/// (z.B. ".2" oder "+3") und optionaler Notiz.
class CollectionEntry {
  final String code;
  final String qualifier;
  final String note;

  const CollectionEntry({
    required this.code,
    this.qualifier = '',
    this.note = '',
  });

  /// Der volle Code inkl. Qualifier, z.B. "b144.2".
  String get qualifiedCode => '$code$qualifier';

  CollectionEntry copyWith({String? qualifier, String? note}) {
    return CollectionEntry(
      code: code,
      qualifier: qualifier ?? this.qualifier,
      note: note ?? this.note,
    );
  }

  factory CollectionEntry.fromJson(Map<String, dynamic> json) {
    return CollectionEntry(
      code: json['code'] as String,
      qualifier: json['qualifier'] as String? ?? '',
      note: json['note'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        if (qualifier.isNotEmpty) 'qualifier': qualifier,
        if (note.isNotEmpty) 'note': note,
      };
}

/// Eine benannte Sammlung von ICF-Codes, z.B. für einen (anonymen) Fall
/// oder ein Thema.
class CodeCollection {
  final String id;
  final String name;
  final List<CollectionEntry> entries;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CodeCollection({
    required this.id,
    required this.name,
    this.entries = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  CodeCollection copyWith({
    String? name,
    List<CollectionEntry>? entries,
    DateTime? updatedAt,
  }) {
    return CodeCollection(
      id: id,
      name: name ?? this.name,
      entries: entries ?? this.entries,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory CodeCollection.fromJson(Map<String, dynamic> json) {
    return CodeCollection(
      id: json['id'] as String,
      name: json['name'] as String,
      entries: (json['entries'] as List<dynamic>? ?? [])
          .map((e) => CollectionEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'entries': entries.map((e) => e.toJson()).toList(),
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}

class IcfDetail {
  final String title;
  final String description;
  final List<String> inclusions;
  final List<String> exclusions;

  const IcfDetail({
    required this.title,
    this.description = '',
    this.inclusions = const [],
    this.exclusions = const [],
  });

  factory IcfDetail.fromJson(Map<String, dynamic> json) {
    return IcfDetail(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      inclusions: (json['inclusions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exclusions: (json['exclusions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'inclusions': inclusions,
        'exclusions': exclusions,
      };
}

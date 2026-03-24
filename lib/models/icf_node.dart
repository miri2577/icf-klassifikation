class IcfNode {
  final String code;
  final String title;
  final List<IcfNode> children;

  const IcfNode({
    required this.code,
    required this.title,
    this.children = const [],
  });
}

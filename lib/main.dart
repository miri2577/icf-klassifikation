import 'package:flutter/material.dart';
import 'icf_codes.dart';
import 'icf_details.dart';

void main() {
  runApp(const IcfApp());
}

class IcfApp extends StatelessWidget {
  const IcfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICF Klassifikation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF009CDE),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: const Color(0xFF009CDE),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  int _selectedIndex = 0;

  static const _domainKeys = ['b', 's', 'd', 'e'];
  static const _domainNames = [
    'Körperfunktionen',
    'Körperstrukturen',
    'Aktivitäten & Partizipation',
    'Umweltfaktoren',
  ];
  static const _domainIcons = [
    Icons.psychology,
    Icons.accessibility_new,
    Icons.directions_walk,
    Icons.public,
  ];
  static const _domainColors = [
    Color(0xFF4CAF50),
    Color(0xFF2196F3),
    Color(0xFFFF9800),
    Color(0xFF9C27B0),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _searchQuery.isNotEmpty
          ? _buildSearchResults()
          : _buildDomainView(),
      appBar: AppBar(
        title: const Text('ICF Klassifikation'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Code oder Begriff suchen...',
              leading: const Icon(Icons.search),
              trailing: [
                if (_searchQuery.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _searchQuery = '');
                    },
                  ),
              ],
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _searchQuery.isNotEmpty
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (i) =>
                  setState(() => _selectedIndex = i),
              destinations: List.generate(4, (i) => NavigationDestination(
                icon: Icon(_domainIcons[i]),
                label: _domainKeys[i].toUpperCase(),
                tooltip: _domainNames[i],
              )),
            ),
    );
  }

  Widget _buildSearchResults() {
    final query = _searchQuery.toLowerCase();
    final results = <MapEntry<String, String>>[];

    for (final entry in IcfClassification.codes.entries) {
      if (entry.key.toLowerCase().contains(query) ||
          _fixUmlauts(entry.value).toLowerCase().contains(query)) {
        results.add(entry);
      }
    }

    if (results.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('Keine Ergebnisse gefunden',
                style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final entry = results[index];
        final domain = entry.key[0];
        final domainIndex = _domainKeys.indexOf(domain);
        final color =
            domainIndex >= 0 ? _domainColors[domainIndex] : Colors.grey;

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.15),
            child: Text(
              entry.key,
              style: TextStyle(
                fontSize: entry.key.length > 4 ? 9 : 11,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          title: Text(_fixUmlauts(entry.value)),
          subtitle: Text(entry.key,
              style: TextStyle(color: color, fontWeight: FontWeight.w500)),
          onTap: () => _showCodeDetail(context, entry.key, entry.value),
        );
      },
    );
  }

  Widget _buildDomainView() {
    final domainKey = _domainKeys[_selectedIndex];
    final chapters = <MapEntry<String, String>>[];

    for (final entry in IcfClassification.codes.entries) {
      if (entry.key.startsWith(domainKey) && entry.key.length == 2) {
        chapters.add(entry);
      }
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: _domainColors[_selectedIndex].withValues(alpha: 0.1),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(_domainIcons[_selectedIndex],
                    size: 48, color: _domainColors[_selectedIndex]),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${domainKey.toUpperCase()} – ${_domainNames[_selectedIndex]}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${chapters.length} Kapitel',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...chapters.map((chapter) => _ChapterCard(
              code: chapter.key,
              title: _fixUmlauts(chapter.value),
              color: _domainColors[_selectedIndex],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChapterPage(
                    chapterCode: chapter.key,
                    chapterTitle: _fixUmlauts(chapter.value),
                    color: _domainColors[_selectedIndex],
                  ),
                ),
              ),
            )),
      ],
    );
  }

  void _showCodeDetail(BuildContext context, String code, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CodeDetailPage(code: code, title: title),
      ),
    );
  }
}

class _ChapterCard extends StatelessWidget {
  final String code;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _ChapterCard({
    required this.code,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final childCount = IcfClassification.codes.entries
        .where((e) => e.key.startsWith(code) && e.key.length == 4)
        .length;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Text(
            code.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 14,
            ),
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text('$childCount Kategorien'),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class ChapterPage extends StatelessWidget {
  final String chapterCode;
  final String chapterTitle;
  final Color color;

  const ChapterPage({
    super.key,
    required this.chapterCode,
    required this.chapterTitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final categories = IcfClassification.codes.entries
        .where((e) => e.key.startsWith(chapterCode) && e.key.length == 4)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$chapterCode – $chapterTitle'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final subCategories = IcfClassification.codes.entries
              .where((e) =>
                  e.key.startsWith(cat.key) &&
                  e.key.length > cat.key.length)
              .toList();

          return Card(
            margin: const EdgeInsets.only(bottom: 4),
            child: ExpansionTile(
              leading: CircleAvatar(
                radius: 18,
                backgroundColor: color.withValues(alpha: 0.12),
                child: Text(
                  cat.key,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
              title: Text(
                _fixUmlauts(cat.value),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: subCategories.isNotEmpty
                  ? Text('${subCategories.length} Unterkategorien',
                      style: const TextStyle(fontSize: 12))
                  : null,
              children: subCategories.map((sub) {
                final indent = (sub.key.length - 4) * 16.0;
                return ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 24 + indent, right: 16),
                  leading: Text(
                    sub.key,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                  title: Text(
                    _fixUmlauts(sub.value),
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CodeDetailPage(
                        code: sub.key,
                        title: sub.value,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class CodeDetailPage extends StatelessWidget {
  final String code;
  final String title;

  const CodeDetailPage({
    super.key,
    required this.code,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final domain = code[0];
    final domainName = IcfClassification.domains[domain] ?? '';
    final detail = icfAllDetails[code];

    // Build breadcrumb
    final breadcrumbs = <MapEntry<String, String>>[];
    breadcrumbs.add(MapEntry(domain, _fixUmlauts(domainName)));

    if (code.length >= 2) {
      final chapterCode = code.substring(0, 2);
      final chapterTitle = IcfClassification.codes[chapterCode];
      if (chapterTitle != null) {
        breadcrumbs.add(MapEntry(chapterCode, _fixUmlauts(chapterTitle)));
      }
    }

    if (code.length >= 4) {
      final catCode = code.substring(0, 4);
      final catTitle = IcfClassification.codes[catCode];
      if (catTitle != null && catCode != code) {
        breadcrumbs.add(MapEntry(catCode, _fixUmlauts(catTitle)));
      }
    }

    if (code.length >= 5) {
      final subCode = code.substring(0, 5);
      final subTitle = IcfClassification.codes[subCode];
      if (subTitle != null && subCode != code) {
        breadcrumbs.add(MapEntry(subCode, _fixUmlauts(subTitle)));
      }
    }

    // Get children
    final children = IcfClassification.codes.entries
        .where((e) =>
            e.key.startsWith(code) &&
            e.key.length == code.length + 1)
        .toList();

    // Qualifier scale - convert to Map<String, String> for uniform handling
    final qualifiers = domain == 'e'
        ? IcfClassification.environmentalQualifiers
        : IcfClassification.qualifierScale
            .map((k, v) => MapEntry(k.toString(), v));

    return Scaffold(
      appBar: AppBar(
        title: Text(code),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Title card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    code,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _fixUmlauts(title),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),

          // Description
          if (detail != null && detail.description.isNotEmpty) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Beschreibung',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      detail.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],

          // Inclusions
          if (detail != null && detail.inclusions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.add_circle_outline,
                            size: 18,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 8),
                        Text('Inkl.',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...detail.inclusions.map((inc) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('  \u2022  '),
                              Expanded(child: Text(inc)),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],

          // Exclusions
          if (detail != null && detail.exclusions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Card(
              color: Theme.of(context).colorScheme.errorContainer.withValues(alpha: 0.3),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.remove_circle_outline,
                            size: 18,
                            color: Theme.of(context).colorScheme.error),
                        const SizedBox(width: 8),
                        Text('Exkl.',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.error,
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...detail.exclusions.map((exc) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('  \u2022  '),
                              Expanded(child: Text(exc)),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Hierarchy
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hierarchie',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...breadcrumbs.asMap().entries.map((e) {
                    final indent = e.key * 20.0;
                    return Padding(
                      padding: EdgeInsets.only(left: indent, top: 4),
                      child: Row(
                        children: [
                          if (e.key > 0)
                            const Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Text('\u2514 ',
                                  style: TextStyle(color: Colors.grey)),
                            ),
                          Text(
                            '${e.value.key}: ',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Expanded(child: Text(e.value.value)),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Children
          if (children.isNotEmpty) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Unterkategorien',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ...children.map((child) => ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Text(child.key,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).colorScheme.primary,
                              )),
                          title: Text(_fixUmlauts(child.value)),
                          trailing: const Icon(Icons.chevron_right, size: 20),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CodeDetailPage(
                                code: child.key,
                                title: child.value,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],

          // Qualifier scale
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    domain == 'e'
                        ? 'Beurteilungsmerkmale (Umwelt)'
                        : 'Beurteilungsmerkmale',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...qualifiers.entries.map((q) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                              child: Text(
                                q.key,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(_fixUmlauts(q.value))),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Passthrough - source data now uses proper UTF-8 umlauts
String _fixUmlauts(String text) => text;

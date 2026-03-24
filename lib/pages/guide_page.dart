import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.guideTitle),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Was ist ICF?
              _Section(
                icon: Icons.info_outline,
                title: l10n.guideWhatIsIcf,
                child: Text(l10n.guideWhatIsIcfText, style: theme.textTheme.bodyLarge),
              ),

              // Wofür wird ICF verwendet?
              _Section(
                icon: Icons.health_and_safety,
                title: l10n.guideWhatFor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.guideWhatForText, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 12),
                    _BulletList(items: [
                      l10n.guideUse1,
                      l10n.guideUse2,
                      l10n.guideUse3,
                      l10n.guideUse4,
                      l10n.guideUse5,
                    ]),
                  ],
                ),
              ),

              // Aufbau der ICF
              _Section(
                icon: Icons.account_tree,
                title: l10n.guideStructure,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.guideStructureText, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 16),
                    _DomainCard(
                      letter: 'b',
                      name: l10n.bodyFunctions,
                      color: const Color(0xFF4CAF50),
                      example: 'b110 – b152 – b280',
                      desc: l10n.guideDomainB,
                    ),
                    _DomainCard(
                      letter: 's',
                      name: l10n.bodyStructures,
                      color: const Color(0xFF2196F3),
                      example: 's110 – s730 – s750',
                      desc: l10n.guideDomainS,
                    ),
                    _DomainCard(
                      letter: 'd',
                      name: l10n.activitiesParticipation,
                      color: const Color(0xFFFF9800),
                      example: 'd450 – d510 – d850',
                      desc: l10n.guideDomainD,
                    ),
                    _DomainCard(
                      letter: 'e',
                      name: l10n.environmentalFactors,
                      color: const Color(0xFF9C27B0),
                      example: 'e110 – e310 – e580',
                      desc: l10n.guideDomainE,
                    ),
                  ],
                ),
              ),

              // Wie liest man einen ICF-Code?
              _Section(
                icon: Icons.code,
                title: l10n.guideHowToRead,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.guideHowToReadText, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 16),
                    _CodeExample(
                      code: 'b 1 14 0',
                      labels: [
                        l10n.guideDomain,
                        l10n.guideChapter,
                        l10n.guideCategory,
                        l10n.guideSubCategory,
                      ],
                      description: l10n.guideCodeExample,
                    ),
                  ],
                ),
              ),

              // Qualifier
              _Section(
                icon: Icons.tune,
                title: l10n.guideQualifiers,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.guideQualifiersText, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 12),
                    _QualifierTable(),
                    const SizedBox(height: 16),
                    Text(l10n.guideQualifierExample, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('b710.2', style: theme.textTheme.titleMedium?.copyWith(
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          )),
                          const SizedBox(height: 4),
                          Text(l10n.guideQualifierExampleDesc, style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Umweltfaktoren-Qualifier
              _Section(
                icon: Icons.public,
                title: l10n.guideEnvQualifiers,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.guideEnvQualifiersText, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.errorContainer.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.block, color: Colors.red),
                          const SizedBox(width: 12),
                          Expanded(child: Text(l10n.guideBarrierExample)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.thumb_up, color: theme.colorScheme.primary),
                          const SizedBox(width: 12),
                          Expanded(child: Text(l10n.guideFacilitatorExample)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Praxisbeispiel 1: Orthopädie
              _Section(
                icon: Icons.assignment,
                title: l10n.guidePractice1Title,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.guidePractice1Text, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 12),
                    _PracticeExample(
                      codes: [
                        ('b710.2', l10n.guidePractice1Code1),
                        ('b280.1', l10n.guidePractice1Code2),
                        ('d450.2', l10n.guidePractice1Code3),
                        ('d510.0', l10n.guidePractice1Code4),
                        ('e120+3', l10n.guidePractice1Code5),
                        ('e580+2', l10n.guidePractice1Code6),
                      ],
                    ),
                  ],
                ),
              ),

              // Praxisbeispiel 2: Psychische Erkrankung
              _Section(
                icon: Icons.psychology,
                title: l10n.guidePractice2Title,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.guidePractice2Text, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 12),
                    _PracticeExample(
                      codes: [
                        ('b130.3', l10n.guidePractice2Code1),
                        ('b152.3', l10n.guidePractice2Code2),
                        ('b134.2', l10n.guidePractice2Code3),
                        ('d240.2', l10n.guidePractice2Code4),
                        ('d710.3', l10n.guidePractice2Code5),
                        ('d850.4', l10n.guidePractice2Code6),
                        ('e310+3', l10n.guidePractice2Code7),
                        ('e580+2', l10n.guidePractice2Code8),
                        ('e460.2', l10n.guidePractice2Code9),
                      ],
                    ),
                  ],
                ),
              ),

              // Praxisbeispiel 3: Schlaganfall
              _Section(
                icon: Icons.elderly,
                title: l10n.guidePractice3Title,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.guidePractice3Text, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 12),
                    _PracticeExample(
                      codes: [
                        ('b167.2', l10n.guidePractice3Code1),
                        ('b730.3', l10n.guidePractice3Code2),
                        ('b320.2', l10n.guidePractice3Code3),
                        ('s110.3', l10n.guidePractice3Code4),
                        ('d330.3', l10n.guidePractice3Code5),
                        ('d440.3', l10n.guidePractice3Code6),
                        ('d550.1', l10n.guidePractice3Code7),
                        ('e115+3', l10n.guidePractice3Code8),
                        ('e340+4', l10n.guidePractice3Code9),
                        ('e580+3', l10n.guidePractice3Code10),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _Section({required this.icon, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;
  const _BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('  \u2022  '),
                    Expanded(child: Text(item)),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class _DomainCard extends StatelessWidget {
  final String letter;
  final String name;
  final Color color;
  final String example;
  final String desc;

  const _DomainCard({
    required this.letter,
    required this.name,
    required this.color,
    required this.example,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.2),
            child: Text(letter.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, color: color)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(desc, style: Theme.of(context).textTheme.bodySmall),
                Text(example,
                    style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 11,
                        color: color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeExample extends StatelessWidget {
  final String code;
  final List<String> labels;
  final String description;

  const _CodeExample({
    required this.code,
    required this.labels,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final parts = code.split(' ');
    final colors = [
      const Color(0xFF4CAF50),
      const Color(0xFF2196F3),
      const Color(0xFFFF9800),
      const Color(0xFF9C27B0),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(parts.length, (i) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: colors[i].withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colors[i]),
                    ),
                    child: Text(parts[i],
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                            color: colors[i])),
                  ),
                  const SizedBox(height: 4),
                  Text(labels[i],
                      style: TextStyle(fontSize: 10, color: colors[i])),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 12),
        Text(description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center),
      ],
    );
  }
}

class _QualifierTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entries = [
      ('0', '0–4%', 'Kein Problem'),
      ('1', '5–24%', 'Leicht'),
      ('2', '25–49%', 'Mässig'),
      ('3', '50–95%', 'Erheblich'),
      ('4', '96–100%', 'Voll ausgeprägt'),
    ];

    final colors = [
      Colors.green,
      Colors.lightGreen,
      Colors.orange,
      Colors.deepOrange,
      Colors.red,
    ];

    return Table(
      columnWidths: const {
        0: FixedColumnWidth(40),
        1: FixedColumnWidth(70),
        2: FlexColumnWidth(),
      },
      children: entries.asMap().entries.map((e) {
        final idx = e.key;
        final val = e.value;
        return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(val.$1,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(val.$2,
                  style: TextStyle(color: colors[idx], fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(val.$3),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _PracticeExample extends StatelessWidget {
  final List<(String, String)> codes;
  const _PracticeExample({required this.codes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: codes.map((c) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(c.$1,
                    style: TextStyle(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary)),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(c.$2, style: const TextStyle(fontSize: 13))),
            ],
          ),
        );
      }).toList(),
    );
  }
}

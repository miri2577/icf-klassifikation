import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class ImpressumPage extends StatelessWidget {
  const ImpressumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.impressum),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // App info
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/icon/app_icon.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'ICF Klassifikation',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.impressumSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Impressum nach DDG (ehemals TMG §5)
              _InfoCard(
                icon: Icons.person_outline,
                title: l10n.impressumLegal,
                children: [
                  _InfoRow(l10n.responsiblePerson, 'Mirko Richter'),
                  _InfoRow(l10n.address, 'Stillerzeile 29\n12587 Berlin'),
                  _InfoRow(l10n.email, 'mirko.richter@eingliederungshilfe.cloud'),
                  _InfoRow(l10n.website, 'eingliederungshilfe.cloud'),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      l10n.impressumDdgNote,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Datenquelle
              _InfoCard(
                icon: Icons.source_outlined,
                title: l10n.dataSource,
                children: [
                  _InfoRow(l10n.classification,
                      'International Classification of Functioning, Disability and Health (ICF)'),
                  _InfoRow(l10n.publisher,
                      'World Health Organization (WHO)'),
                  _InfoRow(l10n.germanTranslation,
                      'Bundesinstitut für Arzneimittel und Medizinprodukte (BfArM), ehemals DIMDI'),
                  _InfoRow(l10n.dataVersion,
                      'ICF 2005 (Deutsche Fassung)'),
                ],
              ),

              const SizedBox(height: 12),

              // Haftungsausschluss
              _InfoCard(
                icon: Icons.warning_amber_outlined,
                title: l10n.disclaimer,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      l10n.disclaimerText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Medizinprodukte-Hinweis
              _InfoCard(
                icon: Icons.medical_information_outlined,
                title: l10n.medicalDeviceNotice,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      l10n.medicalDeviceNoticeText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Datenschutz
              _InfoCard(
                icon: Icons.privacy_tip_outlined,
                title: l10n.privacyTitle,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      l10n.privacyFullText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Urheberrecht
              _InfoCard(
                icon: Icons.copyright_outlined,
                title: l10n.copyright,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      l10n.copyrightText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

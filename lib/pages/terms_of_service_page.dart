import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.termsOfServiceTitle),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(Icons.description_outlined,
                          size: 48, color: theme.colorScheme.primary),
                      const SizedBox(height: 12),
                      Text(
                        l10n.termsOfServiceTitle,
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.termsLastUpdated,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _Section(
                icon: Icons.handshake_outlined,
                title: l10n.termsAcceptanceTitle,
                text: l10n.termsAcceptanceText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.app_shortcut_outlined,
                title: l10n.termsUsageTitle,
                text: l10n.termsUsageText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.copyright_outlined,
                title: l10n.termsIntellectualPropertyTitle,
                text: l10n.termsIntellectualPropertyText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.medical_information_outlined,
                title: l10n.termsMedicalDisclaimerTitle,
                text: l10n.termsMedicalDisclaimerText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.warning_amber_outlined,
                title: l10n.termsLiabilityTitle,
                text: l10n.termsLiabilityText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.update_outlined,
                title: l10n.termsChangesTitle,
                text: l10n.termsChangesText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.contact_mail_outlined,
                title: l10n.termsContactTitle,
                text: l10n.termsContactText,
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
  final String text;

  const _Section({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(text, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.privacyPolicyTitle),
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
                      Icon(Icons.privacy_tip_outlined,
                          size: 48, color: theme.colorScheme.primary),
                      const SizedBox(height: 12),
                      Text(
                        l10n.privacyPolicyTitle,
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.privacyPolicyLastUpdated,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _Section(
                icon: Icons.info_outline,
                title: l10n.privacyPolicyOverviewTitle,
                text: l10n.privacyPolicyOverviewText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.storage_outlined,
                title: l10n.privacyPolicyDataTitle,
                text: l10n.privacyPolicyDataText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.cloud_off_outlined,
                title: l10n.privacyPolicyNoCollectionTitle,
                text: l10n.privacyPolicyNoCollectionText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.phone_android_outlined,
                title: l10n.privacyPolicyPermissionsTitle,
                text: l10n.privacyPolicyPermissionsText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.child_care_outlined,
                title: l10n.privacyPolicyChildrenTitle,
                text: l10n.privacyPolicyChildrenText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.gavel_outlined,
                title: l10n.privacyPolicyRightsTitle,
                text: l10n.privacyPolicyRightsText,
              ),
              const SizedBox(height: 12),
              _Section(
                icon: Icons.contact_mail_outlined,
                title: l10n.privacyPolicyContactTitle,
                text: l10n.privacyPolicyContactText,
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

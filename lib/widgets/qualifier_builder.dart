import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';

class QualifierBuilder extends StatefulWidget {
  final String code;
  final String domain;
  final Map<String, String> qualifiers;

  const QualifierBuilder({
    super.key,
    required this.code,
    required this.domain,
    required this.qualifiers,
  });

  @override
  State<QualifierBuilder> createState() => _QualifierBuilderState();
}

class _QualifierBuilderState extends State<QualifierBuilder> {
  String? _selectedQualifier;
  bool _isBarrierMode = true; // for environmental factors

  String get _builtCode {
    if (_selectedQualifier == null) return widget.code;
    if (widget.domain == 'e') {
      final level = _selectedQualifier!.replaceAll(RegExp(r'[^0-9]'), '');
      return '${widget.code}${_isBarrierMode ? "." : "+"}$level';
    }
    return '${widget.code}.$_selectedQualifier';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isEnvironmental = widget.domain == 'e';

    // Split environmental qualifiers into barriers and facilitators
    List<MapEntry<String, String>> displayQualifiers;
    if (isEnvironmental) {
      final prefix = _isBarrierMode ? 'barrier_' : 'facilitator_';
      displayQualifiers = widget.qualifiers.entries
          .where((e) => e.key.startsWith(prefix))
          .toList();
    } else {
      displayQualifiers = widget.qualifiers.entries.toList();
    }

    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.build_circle,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(l10n.qualifierBuilder,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),

            // Built code display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .outline
                      .withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _builtCode,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, size: 20),
                    tooltip: l10n.copyCode,
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _builtCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.codeCopied(_builtCode)),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Barrier/Facilitator toggle for environmental factors
            if (isEnvironmental) ...[
              SegmentedButton<bool>(
                segments: [
                  ButtonSegment(
                    value: true,
                    label: Text(l10n.barrier),
                    icon: const Icon(Icons.block, size: 16),
                  ),
                  ButtonSegment(
                    value: false,
                    label: Text(l10n.facilitator),
                    icon: const Icon(Icons.thumb_up, size: 16),
                  ),
                ],
                selected: {_isBarrierMode},
                onSelectionChanged: (values) {
                  setState(() {
                    _isBarrierMode = values.first;
                    _selectedQualifier = null;
                  });
                },
              ),
              const SizedBox(height: 12),
            ],

            // Qualifier selection
            Text(l10n.selectQualifier,
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: displayQualifiers.map((q) {
                final isSelected = _selectedQualifier == q.key;
                final label = q.key
                    .replaceAll('barrier_', '')
                    .replaceAll('facilitator_', '+');
                return Tooltip(
                  message: q.value,
                  child: ChoiceChip(
                    label: Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedQualifier = selected ? q.key : null;
                      });
                    },
                  ),
                );
              }).toList(),
            ),

            if (_selectedQualifier != null) ...[
              const SizedBox(height: 8),
              Text(
                widget.qualifiers[_selectedQualifier] ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';

/// Baut einen ICF-Code mit Beurteilungsmerkmalen (Qualifiern) zusammen.
///
/// Je nach Komponente gelten unterschiedliche Systematiken (ICF, Anhang 2):
/// - b: ein Beurteilungsmerkmal (Ausmaß der Schädigung)
/// - s: bis zu drei Stellen (Ausmaß, Art der Veränderung, Lokalisation)
/// - d: bis zu zwei Stellen (Leistung, Leistungsfähigkeit)
/// - e: Barriere (.) oder Förderfaktor (+) mit einer Stelle
class QualifierBuilder extends StatefulWidget {
  final String code;
  final String domain;
  final Map<String, String> qualifiers;

  /// Skala „Art der Veränderung" für s-Codes (2. Stelle).
  final Map<String, String> natureQualifiers;

  /// Skala „Lokalisation" für s-Codes (3. Stelle).
  final Map<String, String> locationQualifiers;

  /// Anfangs ausgewählter Qualifier-Suffix, z.B. ".2", "+3" oder ".412".
  final String initialQualifier;

  /// Wird bei jeder Änderung mit dem aktuellen Suffix aufgerufen
  /// ('' wenn kein Qualifier gewählt ist).
  final ValueChanged<String>? onQualifierChanged;

  /// Öffnet den "Zu Sammlung hinzufügen"-Dialog mit dem gebauten Code.
  final void Function(String qualifiedCode, String qualifier)?
      onAddToCollection;

  const QualifierBuilder({
    super.key,
    required this.code,
    required this.domain,
    required this.qualifiers,
    this.natureQualifiers = const {},
    this.locationQualifiers = const {},
    this.initialQualifier = '',
    this.onQualifierChanged,
    this.onAddToCollection,
  });

  @override
  State<QualifierBuilder> createState() => _QualifierBuilderState();
}

class _QualifierBuilderState extends State<QualifierBuilder> {
  // Gewählte Stelle je Position (null = nicht gesetzt). Für e-Codes wird
  // nur _digit1 verwendet, zusammen mit _isBarrierMode.
  String? _digit1;
  String? _digit2;
  String? _digit3;
  bool _isBarrierMode = true; // for environmental factors

  int get _maxDigits {
    switch (widget.domain) {
      case 's':
        return 3;
      case 'd':
        return 2;
      default:
        return 1;
    }
  }

  @override
  void initState() {
    super.initState();
    _applyInitial(widget.initialQualifier);
  }

  void _applyInitial(String suffix) {
    if (suffix.isEmpty) return;
    final digits = suffix.substring(1);
    if (widget.domain == 'e') {
      _isBarrierMode = suffix.startsWith('.');
      final key =
          '${_isBarrierMode ? 'barrier' : 'facilitator'}_$digits';
      if (widget.qualifiers.containsKey(key)) _digit1 = digits;
      return;
    }
    if (!suffix.startsWith('.')) return;
    if (digits.isNotEmpty && widget.qualifiers.containsKey(digits[0])) {
      _digit1 = digits[0];
    }
    if (_maxDigits >= 2 && digits.length >= 2) {
      final scale2 =
          widget.domain == 's' ? widget.natureQualifiers : widget.qualifiers;
      if (scale2.containsKey(digits[1])) _digit2 = digits[1];
    }
    if (_maxDigits >= 3 &&
        digits.length >= 3 &&
        widget.locationQualifiers.containsKey(digits[2])) {
      _digit3 = digits[2];
    }
  }

  /// Der Qualifier-Suffix des gebauten Codes, z.B. ".2", "+3" oder ".412".
  String get _suffix {
    if (_digit1 == null) return '';
    if (widget.domain == 'e') {
      return '${_isBarrierMode ? "." : "+"}$_digit1';
    }
    final b = StringBuffer('.')..write(_digit1);
    if (_digit2 != null) {
      b.write(_digit2);
      if (_digit3 != null) b.write(_digit3);
    }
    return b.toString();
  }

  String get _builtCode => '${widget.code}$_suffix';

  void _notifyChanged() {
    widget.onQualifierChanged?.call(_suffix);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isEnvironmental = widget.domain == 'e';

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
                  if (widget.onAddToCollection != null)
                    IconButton(
                      icon: const Icon(Icons.create_new_folder_outlined,
                          size: 20),
                      tooltip: l10n.addToCollection,
                      onPressed: () => widget.onAddToCollection!(
                          _builtCode, _suffix),
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
                    _digit1 = null;
                  });
                  _notifyChanged();
                },
              ),
              const SizedBox(height: 12),
              _buildDigitRow(
                context,
                label: l10n.selectQualifier,
                scale: _environmentalScale(),
                selected: _digit1,
                enabled: true,
                onSelected: (v) {
                  setState(() => _digit1 = v);
                  _notifyChanged();
                },
              ),
            ] else if (widget.domain == 'd') ...[
              _buildDigitRow(
                context,
                label: l10n.qualifierPerformance,
                scale: widget.qualifiers,
                selected: _digit1,
                enabled: true,
                onSelected: (v) {
                  setState(() {
                    _digit1 = v;
                    if (v == null) {
                      _digit2 = null;
                    }
                  });
                  _notifyChanged();
                },
              ),
              const SizedBox(height: 12),
              _buildDigitRow(
                context,
                label: l10n.qualifierCapacity,
                scale: widget.qualifiers,
                selected: _digit2,
                enabled: _digit1 != null,
                onSelected: (v) {
                  setState(() => _digit2 = v);
                  _notifyChanged();
                },
              ),
            ] else if (widget.domain == 's') ...[
              _buildDigitRow(
                context,
                label: l10n.qualifierExtent,
                scale: widget.qualifiers,
                selected: _digit1,
                enabled: true,
                onSelected: (v) {
                  setState(() {
                    _digit1 = v;
                    if (v == null) {
                      _digit2 = null;
                      _digit3 = null;
                    }
                  });
                  _notifyChanged();
                },
              ),
              if (widget.natureQualifiers.isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildDigitRow(
                  context,
                  label: l10n.qualifierNature,
                  scale: widget.natureQualifiers,
                  selected: _digit2,
                  enabled: _digit1 != null,
                  onSelected: (v) {
                    setState(() {
                      _digit2 = v;
                      if (v == null) _digit3 = null;
                    });
                    _notifyChanged();
                  },
                ),
              ],
              if (widget.locationQualifiers.isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildDigitRow(
                  context,
                  label: l10n.qualifierLocation,
                  scale: widget.locationQualifiers,
                  selected: _digit3,
                  enabled: _digit1 != null && _digit2 != null,
                  onSelected: (v) {
                    setState(() => _digit3 = v);
                    _notifyChanged();
                  },
                ),
              ],
            ] else ...[
              _buildDigitRow(
                context,
                label: l10n.selectQualifier,
                scale: widget.qualifiers,
                selected: _digit1,
                enabled: true,
                onSelected: (v) {
                  setState(() => _digit1 = v);
                  _notifyChanged();
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// e-Skala der aktiven Richtung, auf reine Ziffern-Schlüssel reduziert.
  Map<String, String> _environmentalScale() {
    final prefix = _isBarrierMode ? 'barrier_' : 'facilitator_';
    return {
      for (final e in widget.qualifiers.entries)
        if (e.key.startsWith(prefix))
          e.key.substring(prefix.length): e.value,
    };
  }

  Widget _buildDigitRow(
    BuildContext context, {
    required String label,
    required Map<String, String> scale,
    required String? selected,
    required bool enabled,
    required ValueChanged<String?> onSelected,
  }) {
    final displayPrefix =
        widget.domain == 'e' && !_isBarrierMode ? '+' : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: scale.entries.map((q) {
            final isSelected = selected == q.key;
            return Tooltip(
              message: q.value,
              child: ChoiceChip(
                label: Text(
                  '$displayPrefix${q.key}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                selected: isSelected,
                onSelected: enabled
                    ? (sel) => onSelected(sel ? q.key : null)
                    : null,
              ),
            );
          }).toList(),
        ),
        if (selected != null) ...[
          const SizedBox(height: 8),
          Text(
            scale[selected] ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
        ],
      ],
    );
  }
}

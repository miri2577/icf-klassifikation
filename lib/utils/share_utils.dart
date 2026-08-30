import 'package:flutter/widgets.dart';

/// Ursprungs-Rechteck für das Teilen-Popover. Auf dem iPad verankert iOS das
/// Share-Sheet an diesem Rechteck — ohne Angabe erscheint es dort nicht.
Rect shareOriginOf(BuildContext context) {
  final box = context.findRenderObject() as RenderBox?;
  if (box == null || !box.hasSize) {
    final size = MediaQuery.sizeOf(context);
    return Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2), width: 1, height: 1);
  }
  return box.localToGlobal(Offset.zero) & box.size;
}

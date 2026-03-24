import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CodeLinkText extends StatelessWidget {
  final String text;

  const CodeLinkText(this.text, {super.key});

  static final _codePattern = RegExp(r'\b([bsde]\d{2,5})\b');

  @override
  Widget build(BuildContext context) {
    final matches = _codePattern.allMatches(text).toList();
    if (matches.isEmpty) return Text(text);

    final spans = <InlineSpan>[];
    int lastEnd = 0;

    for (final match in matches) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(text: text.substring(lastEnd, match.start)));
      }
      final code = match.group(1)!;
      spans.add(TextSpan(
        text: code,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () => context.push('/code/$code'),
      ));
      lastEnd = match.end;
    }

    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd)));
    }

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: spans,
      ),
    );
  }
}

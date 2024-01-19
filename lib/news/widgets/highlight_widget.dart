import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HighlightWidget extends ConsumerWidget {
  final String text;
  final String request;
  const HighlightWidget({
    super.key,
    required this.text,
    required this.request,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        maxLines: 3,
        softWrap: true,
        text: TextSpan(
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          children:
              HighlightWidget.highlightedText(text: text, request: request),
        ),
      ),
    );
  }

  static List<TextSpan> highlightedText(
      {required String text, required String request}) {
    final allText = text.replaceAll("\n", "...");
    final RegExp regEx = RegExp(request, caseSensitive: false, multiLine: true);
    final textMatches = regEx.allMatches(allText).toList();
    final List<TextSpan> titleText = [];
    if (textMatches.isEmpty) {
      titleText.add(HighlightWidget.highlightedTextSpan(
          text: text, needHighlight: false));
    }

    int startIndex = 0;
    for (int i = 0; i < textMatches.length; i++) {
      final match = textMatches[i];
      titleText.add(
        HighlightWidget.highlightedTextSpan(
            text: text.substring(
              startIndex,
              match.start,
            ),
            needHighlight: false),
      );

      titleText.add(
        HighlightWidget.highlightedTextSpan(
            text: text.substring(
              match.start,
              match.end,
            ),
            needHighlight: true),
      );

      if (i == textMatches.length - 1 && match.end != text.length) {
        titleText.add(
          HighlightWidget.highlightedTextSpan(
            text: text.substring(match.end),
            needHighlight: false,
          ),
        );
      }

      startIndex = match.end;
    }

    return titleText;
  }

  static TextSpan highlightedTextSpan(
      {required String text, required bool needHighlight}) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        backgroundColor:
            needHighlight ? const Color.fromARGB(227, 126, 126, 122) : null,
      ),
    );
  }
}

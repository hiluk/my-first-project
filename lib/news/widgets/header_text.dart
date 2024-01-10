import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderTextWidget extends ConsumerWidget {
  final String text;
  const HeaderTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        width: double.infinity,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

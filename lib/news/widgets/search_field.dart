import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchField extends ConsumerWidget {
  final Future<void> Function() onSearchPressed;
  final StateProvider text;

  const SearchField({
    super.key,
    required this.text,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Consumer(
        builder: (context, ref, child) {
          return TextField(
            onChanged: (value) => ref.read(text.notifier).state = value,
            onEditingComplete: () {},
            cursorColor: Colors.black,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              labelText: 'Search',
              labelStyle: const TextStyle(fontSize: 14),
              // errorText: _validate ? '' : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              suffixIcon: IconButton(
                onPressed: onSearchPressed,
                icon: const Icon(Icons.search),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              focusColor: Colors.black,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

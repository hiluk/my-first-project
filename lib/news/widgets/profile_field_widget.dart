import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileField extends HookConsumerWidget {
  final String? Function(String?)? validator;
  final String labelText;
  final bool isActive;
  final String label;
  final TextEditingController controller;
  const ProfileField({
    super.key,
    required this.labelText,
    required this.label,
    required this.isActive,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 90,
        maxHeight: 101,
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextFormField(
              validator: validator,
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                enabled: isActive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

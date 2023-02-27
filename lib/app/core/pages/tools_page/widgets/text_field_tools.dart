import 'package:flutter/material.dart';

import '../../../ui/styles/text_styles.dart';

class TextFieldTools extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  const TextFieldTools({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffe3e3e3),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: TextStyles.instance.textRegular.copyWith(
              color: Colors.black54,
              fontSize: 18,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

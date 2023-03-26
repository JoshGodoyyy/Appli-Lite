import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';

class TextFieldItem extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String title;

  const TextFieldItem({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyles.instance.textRegular.copyWith(
              fontSize: 16,
            ),
          ),
        ),
        Padding(
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
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';

class EditButton extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final Function onTap;

  const EditButton({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: const BorderRadius.all(
        Radius.circular(24),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white70,
              ),
              Text(
                text,
                style: TextStyles.instance.textRegular.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

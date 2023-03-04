import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final Function() onTap;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton(
          onPressed: () => widget.onTap(),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
          ),
          child: Text(
            widget.label,
          ),
        ),
      ),
    );
  }
}

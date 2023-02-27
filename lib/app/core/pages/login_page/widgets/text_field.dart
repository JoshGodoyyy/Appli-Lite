import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool isObscure;
  final IconData icon;
  final String hintText;
  const LoginTextField({
    Key? key,
    required this.title,
    required this.controller,
    required this.isObscure,
    required this.icon,
    required this.hintText,
  }) : super(key: key);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: context.textStyles.textRegular.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff7466ff),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ]),
            child: TextFormField(
              controller: widget.controller,
              style: const TextStyle(color: Colors.white),
              obscureText: widget.isObscure,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  widget.icon,
                  color: Colors.white,
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.white54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

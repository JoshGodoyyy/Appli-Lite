import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function() onTap;
  const LoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Entrar',
          style: context.textStyles.textRegular
              .copyWith(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}

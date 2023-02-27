import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  final Function() onTap;
  const ForgotPassword({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap(),
      child: Text(
        'Esqueci a senha',
        style: context.textStyles.textRegular.copyWith(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

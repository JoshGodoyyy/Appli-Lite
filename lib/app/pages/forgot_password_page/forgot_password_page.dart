import 'package:appli_lite/app/pages/forgot_password_page/widgets/custom_button.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/forgot_password.dart';
import '../login_page/widgets/login_button.dart';
import '../../core/ui/widgets/text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final idController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff5248b0),
              Color(0xff473e97),
              Color(0xff6357d6),
              Color(0xff6357d6),
            ],
          ),
        ),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Esqueceu a senha?',
                    style: context.textStyles.textTitle,
                  ),
                ),
                const SizedBox(height: 80),
                LoginTextField(
                  title: 'Login',
                  controller: idController,
                  isObscure: false,
                  icon: Icons.person,
                  hintText: '123456',
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CustomButton(
                      label: 'Enviar',
                      onTap: () {},
                    ),
                    CustomButton(
                      label: 'Voltar',
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

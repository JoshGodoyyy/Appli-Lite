import 'package:appli_lite/app/pages/forgot_password_page/forgot_password_page.dart';
import 'package:appli_lite/app/pages/home_page/home_page.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/forgot_password.dart';
import '../../core/ui/widgets/text_field.dart';
import 'widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    'Appli',
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
                LoginTextField(
                  title: 'Senha',
                  controller: senhaController,
                  isObscure: true,
                  icon: Icons.password,
                  hintText: 'Senha',
                ),
                ForgotPassword(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                LoginButton(
                  onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                  label: 'Entrar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

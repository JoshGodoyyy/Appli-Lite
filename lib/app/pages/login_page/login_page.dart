import 'package:appli_lite/app/pages/forgot_password_page/forgot_password_page.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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

  login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: idController.text.trim(),
        password: senhaController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMessageError('Usuário não encontrado');
      } else if (e.code == 'wrong-password') {
        showMessageError('Senha inválida');
      }
    } catch (e) {
      showMessageError(
        e.toString(),
      );
    }
  }

  void showMessageError(String message) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
    );
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'Appli',
                    style: context.textStyles.textRegular.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Realize o login',
                    style: TextStyles.instance.textTitle.copyWith(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 40),
                  LoginTextField(
                    title: 'Login',
                    controller: idController,
                    isObscure: false,
                    icon: Icons.person,
                    hintText: 'email@email.com.br',
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
                    onTap: () {
                      if (idController.text.isEmpty ||
                          senhaController.text.isEmpty) {
                        showMessageError(
                          'Todos os campos devem estar preenchidos',
                        );
                        return;
                      }
                      login();
                    },
                    label: 'Entrar',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

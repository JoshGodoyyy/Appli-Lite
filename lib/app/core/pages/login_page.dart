import 'package:appli_lite/app/core/pages/home_page.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();
    final senhaController = TextEditingController();

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
              ]),
        ),
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
              Text(
                'Login',
                style: context.textStyles.textRegular.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              buildTextFormField(idController, '123456', false, Icons.person),
              Text(
                'Senha',
                style: context.textStyles.textRegular.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              buildTextFormField(
                  senhaController, 'Senha', true, Icons.password_rounded),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Esqueci a senha',
                  style: context.textStyles.textRegular.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextFormField(
      controller, String text, bool isObscure, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
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
          controller: controller,
          style: const TextStyle(color: Colors.white),
          obscureText: isObscure,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            hintText: text,
            hintStyle: const TextStyle(color: Colors.white54),
          ),
        ),
      ),
    );
  }
}

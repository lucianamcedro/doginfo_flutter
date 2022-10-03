import 'package:doginfo/presenter/login/widgets/dog_text_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/login.png',
          height: 200,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0,
          ),
          child: Form(
            child: Column(
              children: [
                DogTextForm(
                  label: 'E-mail',
                ),
                const SizedBox(
                  height: 10,
                ),
                DogTextForm(
                  label: 'Senha',
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

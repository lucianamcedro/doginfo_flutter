import 'package:doginfo/presenter/login/widgets/dog_text_form.dart';
import 'package:doginfo/presenter/pages.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/content.jpeg"),
            opacity: 50,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          Lottie.asset('assets/images/corgi.json', height: 320),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: SizedBox(
              height: screenHeight * 0.51,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: screenHeight * 0.03,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'INFO PET',
                          style: GoogleFonts.luckiestGuy().copyWith(
                            color: Colors.blueGrey,
                            fontSize: 32,
                            shadows: [
                              const Shadow(
                                blurRadius: 5.0,
                                color: Colors.grey,
                                offset: Offset(1.0, 1.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Form(
                        child: Column(
                          children: [
                            DogTextForm(
                              label: 'E-mail',
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            DogTextForm(
                              label: 'Senha',
                              obscureText: true,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Esqueceu sua senha?',
                                  style: TextStyle(color: Colors.red[200]),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(screenHeight * 0.4, 50),
                                backgroundColor: Colors.blueGrey,
                              ),
                              onPressed: () {},
                              child: const Text(
                                'ENTRAR',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Text(
                                    'OU ENTRAR COM',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 170,
                                  height: 45,
                                  child: SignInButton(
                                    Buttons.Google,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onPressed: () {},
                                    text: 'Google',
                                  ),
                                ),
                                SizedBox(
                                  width: 170,
                                  height: 45,
                                  child: SignInButton(
                                    Buttons.Facebook,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onPressed: () {},
                                    text: 'Facebook',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Não tem conta?'),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegisterPage()));
                                    },
                                    child: const Text('Cadastre-se'))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

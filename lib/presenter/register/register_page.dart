import 'package:doginfo/presenter/login/widgets/dog_text_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
          Lottie.asset('assets/images/corgi.json', height: 350),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: SizedBox(
              height: screenHeight * 0.38,
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
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Seja bem vindo!',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w200),
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
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            DogTextForm(
                              label: 'Confirmar Senha',
                              obscureText: true,
                            ),
                            SizedBox(
                              height: screenHeight * 0.03,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(screenHeight * 0.4, 50),
                                backgroundColor: Colors.blueGrey,
                              ),
                              onPressed: () {},
                              child: const Text(
                                'CADASTRAR-SE',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
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

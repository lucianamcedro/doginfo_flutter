import 'dart:io';

import 'package:doginfo/presenter/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/screen.png',
            height: 300,
            width: 400,
          ),
          const SizedBox(
            height: 30,
          ),
          if (Platform.isIOS)
            const CupertinoActivityIndicator(
              radius: 15,
            )
          else
            const CircularProgressIndicator(
              color: Colors.white,
            ),
        ]),
      ),
    );
  }
}

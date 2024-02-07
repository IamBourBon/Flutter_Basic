import 'dart:async';

import 'package:flutter_application_2/pages/auth_page/auth_page.dart';
// import 'package:flutter_application_2/pages/sign_up/sign_up.dart';
import 'package:flutter_application_2/style/app_style.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  bool mounted = false;

  @override
  void initState() {
    super.initState();
    changePage();
  }

  void changePage() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()),
          (route) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Stack(
        children: [
          //pattern
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Transform.scale(
              scale: 1,
              child: Image.asset(AppStyle.patternImage),
            ),
          ),

          //logo
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            top: 0,
            child: Transform.scale(
              scale: 0.9,
              child: Image.asset(AppStyle.logoImage),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/bottom_bar.dart';
import 'package:flutter_application_2/pages/sign_up/sign_up.dart';

class AuthPage extends StatelessWidget {
  static String routeName = "/auth";
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              return const BottomBar();
            } else {
              return const SignUp();
            }
          }
        },
      ),
    );
  }
}

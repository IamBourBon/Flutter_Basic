import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/pages/auth_page/auth_page.dart';
import 'package:flutter_application_2/pages/login_page/login.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';

import 'package:flutter_application_2/style/app_style.dart';
import 'package:flutter_application_2/pages/splash/splash.dart';
import 'package:flutter_application_2/pages/sign_up/sign_up.dart';
import 'package:flutter_application_2/components/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FLUTTER UI",
      theme: AppStyle.theme,
      routes: {
        '/': (context) => const Splash(),
        AuthPage.routeName: (context) => const AuthPage(),
        SignUp.routeName: (context) => const SignUp(),
        Login.routeName: (context) => const Login(),
        BottomBar.routeName: (context) => const BottomBar(),
      },
    );
  }
}

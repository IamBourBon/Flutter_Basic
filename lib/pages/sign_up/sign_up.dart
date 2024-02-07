import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/sign_up/components/button_portion.dart';
import 'package:flutter_application_2/pages/sign_up/components/text_portion.dart';
import 'package:flutter_application_2/style/app_style.dart';

class SignUp extends StatelessWidget {
  static const String routeName = '/sign-up';
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
          const Spacer(),
          Image.asset(AppStyle.imageSignIn),
          const Spacer(),
          //text portion
          const TextPortion(),
          //button area
          const Spacer(),
          const ButtonPortion(),
          const Spacer(),
        ],
      ),
    );
  }
}
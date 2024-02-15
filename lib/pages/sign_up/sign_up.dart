import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/sign_up/components/button_portion.dart';
import 'package:flutter_application_2/pages/sign_up/components/text_portion.dart';
import 'package:flutter_application_2/style/app_style.dart';

class SignUp extends StatelessWidget {
  static const String routeName = '/sign-up';
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column( 
            children: [
              Image.asset(AppStyle.imageStarted),
              SizedBox(height: size.height / 100),
              //text portion
              TextPortion(size: size),
              //button area
              SizedBox(height: size.height / 100 * 8),
              const ButtonPortion(),
              SizedBox(height: size.height / 100),
            ],
          ),
        ),
      ),
    );
  }
}
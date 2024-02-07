import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/auth_page/auth_page.dart';
import 'package:flutter_application_2/pages/login_page/login.dart';
import 'package:flutter_application_2/services/google_service.dart';
import 'package:flutter_application_2/style/app_style.dart';

class ButtonPortion extends StatelessWidget {
  const ButtonPortion({super.key});

  @override
  Widget build(BuildContext context) {
    GoogleService googleAuth = GoogleService();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: OverflowBar(
        overflowSpacing: 20,
        children: [
          //APP SIGNUP
          ElevatedButton(
            child: Text(
              'Create an Account',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AuthPage.routeName, (route) => false);
            },
          ),

          //GOOGLE SIGNUP
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: AppStyle.borderColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppStyle.googleIcon),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Sign in with Google',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppStyle.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            onPressed: () {
              googleAuth.handleSignIn();
              Navigator.pushNamedAndRemoveUntil(
                  context, AuthPage.routeName, (route) => false);
            },
          ),

          const SizedBox(
            height: 5,
          ),

          //SIGN IN
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                // textAlign: TextAlign.right,
                text: TextSpan(
                  text: "Already a member?\t",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: <InlineSpan>[
                    WidgetSpan(
                        child: GestureDetector(
                      onTap: () =>
                          {Navigator.pushNamed(context, Login.routeName)},
                      child: Text(
                        "Sign in",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: AppStyle.primaryColor,
                                fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

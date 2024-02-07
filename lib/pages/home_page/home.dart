import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/auth_page/auth_page.dart';
import 'package:flutter_application_2/pages/home_page/components/payment_card.dart';
import 'package:flutter_application_2/pages/home_page/components/recent_transaction.dart';
import 'package:flutter_application_2/pages/home_page/components/single_menu.dart';
import 'package:flutter_application_2/style/app_style.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //title
              ListTile(
                title: Text(
                  "Good Evening",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  user!.email.toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                trailing: DecoratedBox(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppStyle.borderColor,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  child: IconButton(
                      onPressed: () {
                        // FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(
                            context, AuthPage.routeName, (route) => false);
                      },
                      icon: const Icon(Icons.login)),
                ),
              ),

              SizedBox(
                height: size.height / 100 * 2,
              ),

              const PaymentCard(),

              SizedBox(
                height: size.height / 100 * 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleMenu(
                      text: "Send",
                      icon: AppStyle.sendIcon,
                      onPressed: () => {print('aaa')},
                    ),
                    SingleMenu(
                      text: "Receive",
                      icon: AppStyle.receivedIcon,
                      onPressed: () => {print('aaa')},
                    ),
                    SingleMenu(
                      text: "Lock Card",
                      icon: AppStyle.lockIcon,
                      onPressed: () => {print('aaa')},
                    ),
                    SingleMenu(
                      text: "Settings",
                      icon: AppStyle.settingIcon,
                      onPressed: () => {print('aaa')},
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height / 100 * 2,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Recent Transactions",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    CupertinoButton(
                        child: Text(
                          "See all",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppStyle.primaryColor),
                        ),
                        onPressed: () => {}),
                  ],
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              const RecentTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}

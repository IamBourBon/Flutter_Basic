import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/components/bottom_bar.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  //fix error "unknow" in FirebaseAuthException when debug in browser
  String parseFirebaseAuthExceptionMessage(
      {String plugin = "auth", required String? input}) {
    if (input == null) {
      return "unknown";
    }

    // https://regexr.com/7en3h
    String regexPattern = r'(?<=\(' + plugin + r'/)(.*?)(?=\)\.)';
    RegExp regExp = RegExp(regexPattern);
    Match? match = regExp.firstMatch(input);
    if (match != null) {
      return match.group(0)!;
    }

    return "unknown";
  }

  signInWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);

      setState(() {
        isLoading = false;
      });

      if (!context.mounted) return;

      Navigator.pushNamedAndRemoveUntil(
          context, BottomBar.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      final code = parseFirebaseAuthExceptionMessage(input: e.message);

      if (code == 'invalid-credential') {
        setState(() {
          isLoading = false;
        });
        return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email or Password incorrect')));
      } else if (code == 'invalid-email') {
        setState(() {
          isLoading = false;
        });
        return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email is not invalid')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 100 * 5),
        child: Form(
          key: _formKey,
          child: OverflowBar(
            overflowSpacing: 20,
            children: [
              TextFormField(
                controller: _email,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Email is empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                controller: _password,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Password is empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: "Password"),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height / 100 * 5,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signInWithEmailAndPassword();
                    }
                  },
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height / 100 * 5,
                child: ElevatedButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

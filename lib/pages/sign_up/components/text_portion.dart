import 'package:flutter/material.dart';
import 'package:flutter_application_2/style/app_style.dart';

class TextPortion extends StatelessWidget {
  final Size size;

  const TextPortion({super.key, required this.size});
  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Text(
            "Bank on-the-go with our app",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: size.height / 100 * 3.5
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height / 100 * 1,
          ),
          Text(
            "Manage your finances anytime, anywhere with our online banking app",
            style: TextStyle(color: AppStyle.textColor, fontSize: size.height / 100 * 2.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextPortion extends StatelessWidget {
  const TextPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Text(
            "Bank on-the-go with our app",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 30,),
          
          Text(
            "Manage your finances anytime, anywhere with our online banking app",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              height: 1.8
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
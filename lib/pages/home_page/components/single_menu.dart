import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/style/app_style.dart';

class SingleMenu extends StatelessWidget {
  final String text;
  final String icon;
  final void Function()? onPressed;

  @override
  const SingleMenu(
      {super.key, required this.text, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoButton(
      onPressed: onPressed,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 1,
                    color: AppStyle.borderColor,
                    style: BorderStyle.solid)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(size.width / 100 * 2.5),
                child: Image.asset(
                  icon,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 100 * 1.5,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}

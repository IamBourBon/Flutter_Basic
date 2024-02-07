import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_application_2/style/app_style.dart";

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: _buildTransaction(size, context));
  }

  dynamic _buildTransaction(size, context) {
    List<Widget> children = [];

    Map<String, String> itemDate = {
      'Upwork': 'Apr 15,2023',
      'Netflix': 'Apr 15,2023',
      'Spotify': 'Apr 15,2023',
    };

    Map<String, int> itemPrice = {
      'Upwork': 500,
      'Netflix': -10,
      'Spotify': -15,
    };

    for (String name in itemDate.keys) {
      children.add(
        CupertinoButton(
          onPressed: () => {},
          child: Container(
            margin: EdgeInsets.only(top: size.height / 100 * 1.5),
            padding: EdgeInsets.symmetric(
                horizontal: size.width / 100 * 4,
                vertical: size.height / 100 * 1),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppStyle.borderColor),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(7),
              leading: Container(
                width: 53,
                height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppStyle.borderColor.withOpacity(0.5)),
                child: Image.asset(AppStyle.bellIcon),
              ),
              title: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              subtitle: Text(
                itemDate[name]!,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black),
              ),
              trailing: Text(
                "${itemPrice[name].toString()} \$",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: itemPrice[name]! >= 0 ? Colors.green : Colors.red),
              ),
            ),
          ),
        ),
      );
    }

    return children;
  }
}

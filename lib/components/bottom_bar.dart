import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page/home.dart';
import 'package:flutter_application_2/style/app_style.dart';

class BottomBar extends StatefulWidget {
  static const routeName = "/bottom-bar";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> tabs = [
    HomePage(),
    const Center(
      child: Text(
        "Search",
        style: TextStyle(
          color: AppStyle.primaryColor,
        ),
      ),
    ),
    const Center(
      child: Text(
        "Profile",
        style: TextStyle(
          color: AppStyle.primaryColor,
        ),
      ),
    ),
    const Center(
      child: Text(
        "Notification",
        style: TextStyle(
          color: AppStyle.primaryColor,
        ),
      ),
    ),
    const Center(
      child: Text(
        "QR code",
        style: TextStyle(
          color: AppStyle.primaryColor,
        ),
      ),
    ),
  ];

  int currentIndex = 0;

  setPage(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //qr button
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => setPage(4),
        backgroundColor: AppStyle.primaryColor,
        child: Transform.scale(
            scale: 0.8, child: Image.asset(AppStyle.qrcodeIcon)),
      ),

      //bottom_bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        elevation: 1,
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => setPage(0),
                  icon: Transform.scale(
                      scale: 0.7,
                      child: Image.asset(
                        AppStyle.homeIcon,
                        color: currentIndex == 0
                            ? AppStyle.primaryColor
                            : Colors.grey[600],
                      ))),
              IconButton(
                  onPressed: () => setPage(1),
                  icon: Transform.scale(
                      scale: 0.7,
                      child: Image.asset(
                        AppStyle.bellIcon,
                        color: currentIndex == 1
                            ? AppStyle.primaryColor
                            : Colors.grey[600],
                      ))),
              IconButton(
                  onPressed: () => setPage(2),
                  icon: Transform.scale(
                      scale: 0.7,
                      child: Image.asset(
                        AppStyle.transferIcon,
                        color: currentIndex == 2
                            ? AppStyle.primaryColor
                            : Colors.grey[600],
                      ))),
              IconButton(
                  onPressed: () => setPage(3),
                  icon: Transform.scale(
                      scale: 0.7,
                      child: Image.asset(
                        AppStyle.profileIcon,
                        color: currentIndex == 3
                            ? AppStyle.primaryColor
                            : Colors.grey[600],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

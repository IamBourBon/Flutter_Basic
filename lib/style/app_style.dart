import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  //App Image
  static const String patternImage = "images/pattern.png";
  static const String imageStarted = "images/image1.jpg";
  static const String imageLogin = "images/image2.jpg";

  //App Logo
  static const String logoImage = "images/logo.png";
  static const String logoVisa = "images/logo_visa_1.png";

  //App Icon
  static const String qrcodeIcon = "images/icon_qr_2.png";
  static const String googleIcon = "images/icon_google_2.png";
  static const String homeIcon = "images/icon_home_1.png";
  static const String bellIcon = "images/icon_bell_1.png";
  static const String transferIcon = "images/icon_transfer_1.png";
  static const String profileIcon = "images/icon_profile_1.png";
  static const String moreIcon = "images/icon_more_3.png";
  static const String sendIcon = "images/icon_send_3.png";
  static const String receivedIcon = "images/icon_received.png";
  static const String lockIcon = "images/icon_lock.png";
  static const String settingIcon = "images/icon_setting.png";

  //App Style
  static const primaryColor = Color(0xff185ADB);
  static const textColor = Color(0xff0A1931);
  static const lightTextColor = Color(0xff666666);
  static const borderColor = Color(0xffCFCFCF);

  static const List<Color> gardientColors = [
    Color(0xff185ADB),
    Color(0xff113E98)
  ];

  static ThemeData? theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          minimumSize: const Size(double.infinity, 58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      textTheme: GoogleFonts.interTextTheme()
          .copyWith(
            headlineLarge: GoogleFonts.sora(
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          )
          .apply(
            bodyColor: lightTextColor,
          ));
}

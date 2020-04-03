import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x9cinema/ui/Splash.dart';
import 'package:x9cinema/util/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'X9CINEMA',
      home: Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: UIColors.pink,
        accentColor: UIColors.pink,
        scaffoldBackgroundColor: UIColors.lightGrey,
        dividerColor: Colors.grey,
        dividerTheme: DividerThemeData(color: Colors.grey),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: UIColors.lightGrey,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black,
              fontSize: 18,
              letterSpacing: -1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        chipTheme: ChipThemeData(
          pressElevation: 0,
          elevation: 0,
          showCheckmark: false,
          backgroundColor: UIColors.lightGrey,
          selectedColor: UIColors.pink,
          padding: EdgeInsets.all(14),
          selectedShadowColor: UIColors.pink.withOpacity(0.4),
          disabledColor: Colors.grey.shade100,
          secondarySelectedColor: UIColors.pink,
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
          brightness: Brightness.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
          secondaryLabelStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        primaryColor: UIColors.lightPink,
        accentColor: Colors.redAccent,
        appBarTheme: AppBarTheme(color: Colors.black),
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        bottomAppBarColor: Color(0xFF1B1B1B),
        chipTheme: ChipThemeData(
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          pressElevation: 0,
          elevation: 0,
          showCheckmark: false,
          selectedShadowColor: UIColors.pink.withOpacity(0.4),
          disabledColor: Colors.grey.shade900,
          selectedColor: UIColors.lightPink,
          secondarySelectedColor: UIColors.lightPink,
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
          padding: EdgeInsets.all(14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
          secondaryLabelStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}

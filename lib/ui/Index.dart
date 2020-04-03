import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x9cinema/ui/home/Home.dart';
import 'package:x9cinema/util/colors.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int currentIndex = 0;

  final icons = [
    "images/icons/film.png",
    "images/icons/fire.png",
    Icon(Icons.bookmark),
    Icon(Icons.person),
  ];

  final pages = [
    Home(),
    Home(),
    Home(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: icons.asMap().map((i, icon) {
              bool active = i == currentIndex;
              final color = active ? Theme.of(context).primaryColor : UIColors.grey;
              Widget button;
              if (i < 2) {
                button = IconButton(
                  icon: Image.asset(
                    icon.toString(),
                    height: 20,
                    color: color,
                  ),
                  onPressed: () => setState(() => currentIndex = i),
                );
              }
              else {
                button = IconButton(
                  icon: icons[i],
                  color: color,
                  onPressed: () => setState(() => currentIndex = i),
                );
              }
              return MapEntry(i, button);
            }).values.toList(),
          ),
        ),
      ),
    );
  }
}

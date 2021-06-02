import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        chipTheme: ChipThemeData(
          deleteIconColor: Colors.white,
          backgroundColor: Colors.teal.shade800,
          brightness: Brightness.light,
          disabledColor: Colors.grey,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
          padding: EdgeInsets.all(10),
          secondaryLabelStyle: TextStyle(),
          secondarySelectedColor: Colors.red,
          selectedColor: Colors.blue,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

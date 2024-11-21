import 'package:flutter/material.dart';
import 'package:icon_app/model/app_icon_data.dart';
import 'package:icon_app/screens/app.dart';

AppIconData iconData = AppIconData();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: App(iconData),
    );
  }
}

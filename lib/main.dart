import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.red),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}

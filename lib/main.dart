import 'package:flutter/material.dart';
import 'package:flutter_app_fboss/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'boss直聘',
      theme: ThemeData(
          //图标的颜色
          primaryIconTheme: const IconThemeData(color: Colors.white),
          brightness: Brightness.light,
          //主色调
          primaryColor: Color.fromARGB(255, 0, 215, 198),
          accentColor: Colors.cyan[300]
      ),
      home: SplashPage(),
    );
  }
}

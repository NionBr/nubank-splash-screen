import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank_splash_screen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Color(0xff612F74),
        accentColor: Color(0xff612F74),
      ),
    );
  }
}

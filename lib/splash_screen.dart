import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nubank_splash_screen/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation, slideAnimation, textAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    Timer(Duration(seconds: 2), () {
      controller.forward();
    });
    Timer(Duration(milliseconds: 4500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    double width = MediaQuery.of(context).size.width;

    scaleAnimation = Tween<double>(begin: 1, end: 0.5).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0, 0.5, curve: Curves.easeOut),
    ));
    slideAnimation =
        Tween<double>(begin: 0, end: -width / 3.6).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.7, 1, curve: Curves.easeInOut),
    ));
    textAnimation =
        Tween<double>(begin: 0, end: width / 2.25).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.6, 1, curve: Curves.easeOut),
    ));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xff612F74),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: textAnimation,
              builder: (_, widget) => Transform.translate(
                offset: Offset(textAnimation.value, 0),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Hello, world!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: AnimatedBuilder(
                animation: slideAnimation,
                builder: (_, widget) => Transform.translate(
                  offset: Offset(slideAnimation.value, 0),
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 1.8,
                    color: Color(0xff612F74),
                  ),
                ),
              ),
            ),
            Center(
              child: AnimatedBuilder(
                animation: scaleAnimation,
                builder: (_, widget) => Transform.scale(
                  scale: scaleAnimation.value,
                  child: Transform.translate(
                    offset: Offset(slideAnimation.value, 0),
                    child: Container(
                      color: Color(0xff612F74),
                      child: Image.asset(
                        'assets/images/nubank-logo.png',
                        width: size / 4.3,
                        height: size / 4.3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

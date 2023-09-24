import 'dart:async';
import 'package:flutter/material.dart';
import '../introduction_screen/introduction_screen.dart';
import '../utilis/colors.dart';
import '../utilis/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          this.context, MaterialPageRoute(builder: (context) => IntroductionPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCode.pageback_appbar_icon_color,
      body: SafeArea(
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset(Images.open_screen),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Aizat/Desktop/KrisWonderer/lib/screens/PersonalityPage.dart';
import 'package:kriswonderer/custom-widgets/AppStyle.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 120.0,
          backgroundImage: ExactAssetImage("assets/Logo/logo.png"),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    transition();
  }

  void transition() async {
    Timer(
      Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => PersonalityPage())
      )
    );
  }
}

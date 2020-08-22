import 'dart:async';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Aizat/Desktop/KrisWonderer/lib/screens/PersonalityPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body:Center(
        child: CircleAvatar(
          radius: 200.0,
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
      Duration(seconds: 0),
        () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => PersonalityPage())
      )
    );
  }
}

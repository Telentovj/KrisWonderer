import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "./screens/SplashScreen.dart";
import "./models/Database.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: Database().dbLocations,
      child: MaterialApp(
        home: SplashScreen(),
        theme: ThemeData().copyWith(
          primaryColor: Color(0xff1d4886),
          accentColor: Color(0xfffcb130),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


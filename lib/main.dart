import 'package:flutter/material.dart';
import 'package:kriswonderer/Database.dart';
import 'package:kriswonderer/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'Home.dart';

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
        debugShowCheckedModeBanner: false,
      )
    );
  }
}


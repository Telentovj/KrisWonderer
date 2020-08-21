import 'package:flutter/material.dart';
import 'package:kriswonderer/Database.dart';
import 'package:kriswonderer/MapPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: database().DBLocations,
      child: MaterialApp(
        home: MapPage(),
      )
    );
  }
}


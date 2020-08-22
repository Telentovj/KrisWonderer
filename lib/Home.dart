import 'package:flutter/material.dart';
import 'package:kriswonderer/LocationPicker.dart';

import 'MapPage.dart';
import 'PersonalityPage.dart';

class Home extends StatefulWidget {
  final String personality;
  final int days;
  final int hours;
  final int minutes;
  Home({Key key, @required this.personality, @required this.days, @required this.hours, @required this.minutes}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //all the variables are here already
    print(widget.personality);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('KrisWonderer'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.map)),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            LocationPicker(),
            MapPage(),
          ],
        ),
      ),
    );
  }
}

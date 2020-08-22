import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:kriswonderer/Location.dart";

import 'MapPage.dart';
import 'PersonalityPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final List<Location> allLocations = Provider.of<List<Location>>(context) ?? [];

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
            PersonalityPage(),
            MapPage(locations: allLocations,),
          ],
        ),
      ),
    );
  }
}

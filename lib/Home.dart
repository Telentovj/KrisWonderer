import 'package:flutter/material.dart';
import "package:kriswonderer/Location.dart";
import 'package:kriswonderer/LocationPicker.dart';
import 'package:kriswonderer/Personality.dart';
import 'package:provider/provider.dart';
import 'MapPage.dart';

class Home extends StatefulWidget {
  final Personality personality;
  final Duration duration;

  Home({
    Key key,
    @required this.personality,
    @required this.duration,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final List<Location> allLocations = Provider.of<List<Location>>(context) ?? [];

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
            MapPage(
              locations: allLocations,
              duration: widget.duration.inMinutes,
              personality: widget.personality,
            ),
          ],
        ),
      ),
    );
  }
}

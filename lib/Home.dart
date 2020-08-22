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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          automaticallyImplyLeading: false,
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
            LocationPicker(
                locations: _getLocations(allLocations, widget.duration.inMinutes),
                fullLocation: allLocations,
            ),
            MapPage(
                locations: _getLocations(allLocations, widget.duration.inMinutes)
            ),
          ],
        ),
      ),
    );
  }

  List<Location> _getLocations(List<Location> allLocations, int duration) {
    // Sort by descending the personality value of the location
    allLocations.sort(
            (a, b) => b.score(widget.personality)
            .compareTo(a.score(widget.personality))
    );

    List<Location> result = [];
    int remainingDuration = duration;
    int i = 0;
    while (remainingDuration > 0 && i < allLocations.length) {
      if (allLocations[i].duration < remainingDuration) {
        result.add(allLocations[i]);
        remainingDuration -= allLocations[i].duration;
      }
      i++;
    }

    return result;
  }
}

import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MapPage.dart';
import "../models/Personality.dart";
import "../custom-widgets/AppStyle.dart";
import "LocationPicker.dart";
import "../models/Location.dart";

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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'KrisWonderer',
            style: AppStyle.standard
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0,12,25,10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Time Left:',
                    style: AppStyle.standard,
                  ),
                  Container(
                    child:_buildCountdown(widget.duration)
                  ),
                ],
              ),
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.map)),
            ],
            unselectedLabelColor: Color(0xffa17528),
            labelColor: AppStyle.accent,
            indicatorColor: AppStyle.accent,
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

 Widget _buildCountdown(Duration duration){
   return CountdownFormatted(
     duration: duration,
     builder: (BuildContext ctx, String remaining) {
       return Text(
         remaining,
         style: TextStyle(fontSize: 12, color: Colors.blue),
       ); // 01:00:00
     },
   );
 }
}

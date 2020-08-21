import 'package:flutter/material.dart';
import 'package:kriswonderer/Location.dart';
import 'package:provider/provider.dart';
class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    final Locations = Provider.of<List<Location>>(context) ?? [];
    return Scaffold(
      body: RaisedButton(
        onPressed: () {
          for(Location location in Locations){
            print(location.name);
          }
        }
      ),
    );
  }
}

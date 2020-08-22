import 'package:flutter/material.dart';
import 'package:kriswonderer/Location.dart';

class LocationTile extends StatelessWidget {

  final Location locale;

  LocationTile({this.locale});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(locale.imageURL) ?? AssetImage('assets/Logo/logo.png') ),
        onTap: (){print("xd");},
        title: Text(locale.name),
        subtitle: Text('Duration: ' + locale.duration.toString() + " minutes    Location: " + locale.location),
      ),
    );
  }
}
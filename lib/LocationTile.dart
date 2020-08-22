import 'package:flutter/material.dart';
import 'package:kriswonderer/Location.dart';
import 'package:kriswonderer/LocationDetailView.dart';

class LocationTile extends StatelessWidget {

  final Location locale;

  LocationTile({this.locale});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getColour(locale.type),
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(locale.imageURL) ?? AssetImage('assets/Logo/logo.png') ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => LocationDetailView(
                locale: this.locale,
              )
          ));
        },
        title: Text(locale.name),
        subtitle: Text('Duration: ' + locale.duration.toString() + " minutes    Location: " + locale.location),
      ),
    );
  }

  Color getColour(String type){
    if(type == 'Foodie'){
      return Colors.orange[50];
    } else if(type == 'Adventurous'){
      return Colors.brown[50];
    } else if(type == 'Nature-Lover'){
      return Colors.green[50];
    } else if(type == 'Shopaholic'){
      return Colors.purple[50];
    } else {
      return Colors.blue[50];
    }
  }

}
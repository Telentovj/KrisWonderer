import 'package:flutter/material.dart';
import 'package:kriswonderer/Location.dart';
import 'package:kriswonderer/SliverCustomerHeaderDelegate.dart';
class LocationDetailView extends StatefulWidget {
  final Location locale;

  LocationDetailView({
    @required this.locale
  });

  @override
  _LocationDetailViewState createState() => _LocationDetailViewState();
}

class _LocationDetailViewState extends State<LocationDetailView> {

  final double _appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
              collapsedHeight: _appBarHeight,
              expandedHeight: 300,
              paddingTop: MediaQuery.of(context).padding.top,
              location: widget.locale,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 50.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Average Time Spent here: ' + widget.locale.duration.toString() + ' minutes',
                            style:Theme.of(context).textTheme.headline6,
                    ),
                        SizedBox(height: 20),
                        Text(
                          "Location: " + widget.locale.location,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Text('Popular with: ',
                              style:Theme.of(context).textTheme.headline6,
                            ),
                            Text(getTypeFormatted(widget.locale.type),
                              style: TextStyle(color: getColour(widget.locale.type)),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text('Desciption: ' ,
                          style:Theme.of(context).textTheme.headline6,),
                        SizedBox(height:10),
                        Text(widget.locale.description + widget.locale.type),
                        SizedBox(height: 30),
                      ]
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      )
    );
  }

  Color getColour(String type){
    if(type == 'Foodie'){
      return Colors.orange;
    } else if(type == 'Adventurous'){
      return Colors.brown;
    } else if(type == 'Nature-Lover'){
      return Colors.green;
    } else if(type == 'Shopaholic'){
      return Colors.purple;
    } else {
      return Colors.blue;
    }
  }

  String getTypeFormatted(String type){
    if(type == 'Foodie'){
      return 'Foodies';
    } else if(type == 'Adventurous'){
      return 'Adventurous People';
    } else if(type == 'Nature-Lover'){
      return 'Nature-Lovers';
    } else if(type == 'Shopaholic'){
      return 'Shopaholic';
    } else {
      return 'Artistic People';
    }
  }
}



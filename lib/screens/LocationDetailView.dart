import 'package:flutter/material.dart';
import "../models/Location.dart";
import '../custom-widgets/AppStyle.dart';
import "../custom-widgets/SliverCustomerHeaderDelegate.dart";

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
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Average time spent here',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontFamily: "GTEestiProText"
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.locale.duration.toString() + ' minutes',
                      style: AppStyle.subtitle
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Location",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontFamily: "GTEestiProText"
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.locale.location,
                      style: AppStyle.subtitle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Popular with',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontFamily: "GTEestiProText"
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      getTypeFormatted(widget.locale.type),
                      style: AppStyle.subtitle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Description' ,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontFamily: "GTEestiProText"
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.locale.description,
                      style: AppStyle.subtitle,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Discounts',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                        fontFamily: "GTEestiProText"
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      discountList(),
                      style: AppStyle.subtitle,
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: 1000,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        color: AppStyle.accent,
                        child: Text(
                          "View on Google Maps",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
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

  String discountList(){
    print(widget.locale.discounts);
    String discounts = '';
    if(widget.locale.discounts != []) {
      for (String discount in widget.locale.discounts) {
        discounts += discount;
        discounts += '\n';
        discounts += "";
        discounts += '\n';
      }
    }
    if (discounts == "") {
      discounts += 'No discounts found';
    }
    return discounts;
  }

  Color getColour(String type){
    if (type == 'Foodie'){
      return Colors.orange;
    } else if (type == 'Adventurous') {
      return Colors.brown;
    } else if (type == 'Nature-Lover') {
      return Colors.green;
    } else if (type == 'Shopaholic') {
      return Colors.purple;
    } else {
      return Colors.blue;
    }
  }

  String getTypeFormatted(String type){
    if (type == 'Foodie') {
      return 'Foodies';
    } else if (type == 'Adventurous') {
      return 'Adventurous people';
    } else if (type == 'Nature-Lover') {
      return 'Nature lovers';
    } else if (type == 'Shopaholic') {
      return 'Shopaholic';
    } else {
      return 'Artistic people';
    }
  }
}



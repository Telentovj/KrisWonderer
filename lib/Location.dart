import 'dart:math';

import 'package:kriswonderer/Personality.dart';

class Location{
  String id;
  List<dynamic> characteristics;
  int duration;
  String imageURL;
  String location;
  String name;
  double x;
  double y;

  Location({
    this.id,
    this.characteristics,
    this.duration,
    this.imageURL,
    this.location,
    this.name,
    this.x,
    this.y,
  });

  // Calculates distance using Haversine formula
  double distanceToLocation(Location other) {
    double p = 0.017453292519943295; // pi/180
    double a = 0.5 - cos((other.x - this.x) * p)/2
        + cos(this.x * p) * cos(other.x * p)
            * (1 - cos((other.y - this.y) * p))/2;

    return 12742 * asin(sqrt(a)) * 1000;
  }

  // Assume current location is starting point
  List<Location> orderToVisit(List<Location> locations) {

    List<Location> result = [];
    Location currentLocation = this;

    while (locations.isNotEmpty) {
      double minDistance = double.maxFinite;
      Location minLocation = currentLocation;

      for (Location location in locations) {
        double distance = currentLocation.distanceToLocation(location);
        if (distance < minDistance) {
          minDistance = distance;
          minLocation = location;
        }
      }

      result.add(minLocation);
      locations.remove(minLocation);
    }

    return result;
  }

  // Used to for ranking best locations based on personality.
  // Necessary because a lot of locations have same characteristic values.
  double score(Personality personality) {
    if (personality == Personality.SPONTANEOUS) {
      Random rng = Random();
      return rng.nextDouble();
    }

    double result = 0;
    for (int i = 0; i < this.characteristics.length; i++) {
      if (i == personality.index) {
        result += this.characteristics[i] * 0.6;
      } else {
        result += this.characteristics[i] * 0.1;
      }
    }

    return result;
  }
}
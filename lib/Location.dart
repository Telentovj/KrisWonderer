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

  double distanceToLocation(Location other) {
    double p = 0.017453292519943295; // pi/180
    double a = 0.5 - cos((other.x - this.x) * p)/2
        + cos(this.x * p) * cos(other.x * p)
            * (1 - cos((other.y - this.y) * p))/2;

    return 12742 * asin(sqrt(a)) * 1000;
  }

  // Assume current location is starting point
  List<Location> orderToVisit(List<Location> givenLocations) {
    List<Location> locations = List<Location>();
    locations.add(this);
    locations.addAll(givenLocations);

    List<bool> visited = List.generate(locations.length, (int i) => false);
    List<Location> result = [];

    Location currentLocation = locations[0];
    visited[0] = true;

    while (result.length < locations.length) {
      Location nextLocation = currentLocation;
      int nextLocationIndex = 0;
      double minDistance = double.maxFinite;

      for (int i = 0; i < visited.length; i++) {
        if (!visited[i]) {
          double distance = currentLocation.distanceToLocation(locations[i]);
          if (distance < minDistance) {
            minDistance = distance;
            nextLocation = locations[i];
          }
        }
      }

      result.add(nextLocation);
      currentLocation = nextLocation;
      visited[nextLocationIndex] = true;
    }

//     return result;
    return locations;
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
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kriswonderer/Location.dart';
import 'package:provider/provider.dart';

import 'Location.dart';
import 'Personality.dart';

class MapPage extends StatefulWidget {
  final Personality personality;
  final int duration;

  MapPage({
    this.personality = Personality.ADVENTUROUS,
    this.duration = 200,
  });

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin<MapPage> {
  // Required to preserve state when switching tabs
  @override
  bool get wantKeepAlive => true;

  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;

  static final CameraPosition _changiAirport = CameraPosition(
    target: LatLng(1.357386, 103.988390),
    zoom: 16,
  );

  // Need to update this variable to the next location in the path
  // every time the floating action button is pressed
  CameraPosition _nextPos = CameraPosition(
    target: LatLng(1.357386, 103.988390),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    // not sure what this does but it makes mixin warning disappear
    super.build(context);
    final List<Location> allLocations = Provider.of<List<Location>>(context) ?? [];
    List<Location> locationsToVisit = _getLocations(allLocations);

    return new Scaffold(
      body: GoogleMap(
        initialCameraPosition: _changiAirport,
        onMapCreated: _onMapCreated,
        markers: _createMarkers(locationsToVisit),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToNextLocation,
        label: Text('Next location'),
        icon: Icon(Icons.airplanemode_active),
      ),
    );
  }

  Future<void> _goToNextLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_nextPos));
  }

  void _onMapCreated(GoogleMapController mapController) {
    _controller.complete(mapController);
    _mapController = mapController;
  }

  // Creates markers on the map. These should be only the locations which
  // the user will be visiting (i.e. not the entire db)
  Set<Marker> _createMarkers(List<Location> locations) {
    Set<Marker> markers = Set<Marker>();

    locations.forEach((location) {
      markers.add(Marker(
        markerId: MarkerId(location.id),
        position: LatLng(location.x, location.y),
        infoWindow: InfoWindow(
          title: location.name,
        ),
      ));
    });

    // Add base marker (Changi Airport)
    markers.add(
      Marker(
        markerId: MarkerId("Base"),
        position: LatLng(1.357386, 103.988390),
        infoWindow: InfoWindow(
          title: "Changi Airport"
        ),
      )
    );

    return markers;
  }

  List<Location> _getLocations(List<Location> allLocations) {
    // Sort by descending the personality value of the location
    allLocations.sort(
        (a, b) => b.score(widget.personality)
            .compareTo(a.score(widget.personality))
    );
    allLocations.forEach((element) {print(element.characteristics);});

    List<Location> result = [];
    int remainingDuration = widget.duration;
    int i = 0;
    while (remainingDuration > 0 && i < allLocations.length) {
      if (allLocations[i].duration < remainingDuration) {
        result.add(allLocations[i]);
        remainingDuration -= allLocations[i].duration;
      }
      i++;
    }

    print(result);
    print(remainingDuration);
    return result;
  }
}

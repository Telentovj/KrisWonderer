import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kriswonderer/Location.dart';
import 'package:provider/provider.dart';

import 'Location.dart';

class MapPage extends StatefulWidget {
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
    final List<Location> locations = Provider.of<List<Location>>(context) ?? [];

    return new Scaffold(
      body: GoogleMap(
        initialCameraPosition: _changiAirport,
        onMapCreated: _onMapCreated,
        markers: _createMarkers(locations),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToChangiAirport,
        label: Text('Next location'),
        icon: Icon(Icons.airplanemode_active),
      ),
    );
  }

  Future<void> _goToChangiAirport() async {
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


}

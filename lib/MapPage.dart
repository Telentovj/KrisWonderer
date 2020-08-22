import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kriswonderer/Location.dart';
import 'Location.dart';

class MapPage extends StatefulWidget {

  final List<Location> locations;

  MapPage({
    @required this.locations,
  });

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin<MapPage> {
  static final CameraPosition _changiAirport = CameraPosition(
    target: LatLng(1.357386, 103.988390),
    zoom: 16,
  );
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;

  // Index of the next location in the path. Updated every time the
  // floating action button is pressed
  int _nextLocationIndex = 0;

  // Required to preserve state when switching tabs
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // not sure what this does but it makes mixin warning disappear
    super.build(context);
    List<Location> locationsToVisit = widget.locations;
    locationsToVisit.forEach((element) {
      print(element.name);
    });

    return new Scaffold(
      body: GoogleMap(
        initialCameraPosition: _changiAirport,
        onMapCreated: _onMapCreated,
        markers: _createMarkers(locationsToVisit),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              color: Color(0xfffcb130),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () => _goToPreviousLocation(locationsToVisit),
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            ),
          ),
          SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              color: Color(0xfffcb130),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () => _goToNextLocation(locationsToVisit),
              icon: Icon(Icons.arrow_forward),
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _goToNextLocation(List<Location> locationsToVisit) async {
    final GoogleMapController controller = await _controller.future;

    // Cycle back to the start if the index exceeds number of locations
    if (_nextLocationIndex >= locationsToVisit.length) {
      _nextLocationIndex = 0;
    }

    Location nextLocation = locationsToVisit[_nextLocationIndex];
    _nextLocationIndex++;

    CameraPosition next = CameraPosition(
      target: LatLng(nextLocation.x, nextLocation.y),
      zoom: 17,
    );

    controller.animateCamera(CameraUpdate.newCameraPosition(next));
  }

  Future<void> _goToPreviousLocation(List<Location> locationsToVisit) async {
    final GoogleMapController controller = await _controller.future;

    // Cycle back to the start if the index exceeds number of locations
    if (_nextLocationIndex < 0) {
      _nextLocationIndex = locationsToVisit.length - 1;
    }

    Location nextLocation = locationsToVisit[_nextLocationIndex];
    _nextLocationIndex--;

    CameraPosition next = CameraPosition(
      target: LatLng(nextLocation.x, nextLocation.y),
      zoom: 17,
    );

    controller.animateCamera(CameraUpdate.newCameraPosition(next));
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

//    // Add base marker (Changi Airport)
//    markers.add(
//      Marker(
//        markerId: MarkerId("Base"),
//        position: LatLng(1.357386, 103.988390),
//        infoWindow: InfoWindow(
//          title: "Changi Airport"
//        ),
//      )
//    );

    return markers;
  }
}


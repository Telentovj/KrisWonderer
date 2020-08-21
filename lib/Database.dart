
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kriswonderer/Location.dart';

class database{

  final Firestore db = Firestore.instance;

  Stream<List<Location>> get DBLocations{
    return db.collection('locations').snapshots().map(allUserDataConversion);
  }

  List<Location> allUserDataConversion(QuerySnapshot snaps){
    return snaps.documents.map((doc){
      return Location(
        name: doc.data['name'] ?? '',
        location: doc.data['location'] ?? '',
        imageURL: doc.data['imageURL'] ?? '',
        duration: doc.data['duration']?? 0,
        characteristics: doc.data['characteristics'] ?? [],
      );
    }).toList();
  }
}
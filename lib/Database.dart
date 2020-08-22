
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kriswonderer/Location.dart';

class Database {

  final Firestore db = Firestore.instance;

  Stream<List<Location>> get dbLocations{
    return db.collection('locations').snapshots().map(allUserDataConversion);
  }

  List<Location> allUserDataConversion(QuerySnapshot snaps){
    return snaps.documents.map((doc){
      return Location(
        id: doc.documentID ?? "500",
        name: doc.data['name'] ?? '',
        location: doc.data['location'] ?? '',
        imageURL: doc.data['imageURL'] ?? '',
        duration: doc.data['duration'] ?? 0,
        characteristics: doc.data['characteristics'] ?? [],
        x: doc.data['x'] ?? 1.353912,
        y: doc.data['y'] ?? 103.989295,
      );
    }).toList();
  }
}
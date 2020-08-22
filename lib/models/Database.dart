
import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///C:/Users/Aizat/Desktop/KrisWonderer/lib/models/Location.dart';

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
        description: doc.data['description'] ?? 'No description',
        type: doc.data['type'],
        discounts: doc.data['Discount'] ?? []
      );
    }).toList();
  }

//  String personalityAggregator(List<dynamic> scores){
//    print(scores);
//    int index = 0;
//    int currentScore = scores[0];
//    for(int score in scores){
//      print(index);
//      if(currentScore < score){
//        index = scores.indexOf(score);
//      }
//    }
//    if(index == 0){
//      return 'Foodie';
//    } else if(index == 1){
//      return 'Adventurous';
//    } else if(index == 2){
//      return 'Nature-Lover';
//    } else if(index == 3){
//      return 'Shopaholic';
//    } else if(index == 4){
//      return 'Artistic';
//    }
//  }
}
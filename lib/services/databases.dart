import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference driverCollection = FirebaseFirestore.instance.collection('drivers');
  Future updateUserData(String name, int trips_taken, int hours_driven) async{
    return await driverCollection.doc(uid).set({
      'name': name,
      'trips_taken': trips_taken,
      'hours_driven': hours_driven, 
    });
  }
  //get drivers stream
Stream<QuerySnapshot> get drivers {
    return driverCollection.snapshots();
}

}


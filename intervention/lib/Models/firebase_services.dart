import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/Models/emission_model.dart';

class FirebaseServices {
  //FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

  Stream<List<EmissionStatistics>> getEmissionList() {
    return FirebaseFirestore.instance.collection('user')
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => EmissionStatistics.fromJson(document.data()))
        .toList());
  }
}
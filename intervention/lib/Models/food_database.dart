import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecovia/Models/emission_model.dart';
import 'package:ecovia/Models/foodquestionnaire_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FoodDatabase {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  final DocumentReference userReference = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final CollectionReference surveyQuestions = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('surveyAnswers');
  final CollectionReference emissionStats = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('emissionStats');

  Stream<List<FoodQuestionnaire>> get foodQuestionnaires {
    return surveyQuestions.orderBy("date", descending: true).snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.map(
            (DocumentSnapshot documentSnapshot) => FoodQuestionnaire(
                questionOne: documentSnapshot.get('questionOne'),
                questionTwo: documentSnapshot.get('questionTwo'),
                questionThree: documentSnapshot.get('questionThree'),
                )).toList());
  }
    Stream<List<EmissionStatistics>> get emissionStatistics {
    return FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("emissionStats").snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.map(
            (DocumentSnapshot documentSnapshot) => EmissionStatistics(
                vegetables: documentSnapshot.data() as String?,
                )).toList());
  }
}

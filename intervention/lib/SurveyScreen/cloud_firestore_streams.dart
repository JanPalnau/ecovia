import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreStreams {
  Stream<QuerySnapshot> surveyAnswerStream() { 
    return FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('surveyAnswers')
      .orderBy('date', descending: true)
      .snapshots();
  } 
  Stream<DocumentSnapshot> userStream() { 
    return FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  } 
}



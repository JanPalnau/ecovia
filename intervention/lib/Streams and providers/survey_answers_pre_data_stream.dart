import 'package:ecovia/JsonObjects/survey_answers_pre_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecovia/References/references.dart';

class SurveyAnswerPreDataStream extends ChangeNotifier {
  Stream<List<SurveyAnswersPreData>> fetchSurveyAnswersPreData() {
    return userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('surveyAnswersPre')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) =>
                SurveyAnswersPreData.fromJson(document.data() as dynamic))
            .toList());
  }
}

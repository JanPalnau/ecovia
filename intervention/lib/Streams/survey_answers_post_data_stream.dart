import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecovia_control/References/references.dart';
import '../JsonObjects/survey_answers_post_data.dart';

class SurveyAnswerPostDataStream extends ChangeNotifier {
  Stream<List<SurveyAnswersPostData>> fetchSurveyAnswersPostData() {
    return userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('surveyAnswers')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) =>
                SurveyAnswersPostData.fromJson(document.data() as dynamic))
            .toList());
  }
}

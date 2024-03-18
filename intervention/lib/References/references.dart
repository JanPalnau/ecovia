import 'package:cloud_firestore/cloud_firestore.dart';



final CollectionReference userCollection =
    FirebaseFirestore.instance.collection("users");

// DocumentReference userReference = FirebaseFirestore.instance
//     .collection("users")
//     .doc(FirebaseAuth.instance.currentUser!.uid);

// DocumentReference paulaReference = FirebaseFirestore.instance
//     .collection("users")
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('paulaStatements')
//     .doc('paulaStatements');

// CollectionReference emissionReference = FirebaseFirestore.instance
//     .collection("users")
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('totalEmissions');

// // DocumentReference recipeDataReference = FirebaseFirestore.instance
// //     .collection('users')
// //     .doc(FirebaseAuth.instance.currentUser!.uid)
// //     .collection('recipeData')
// //     .doc('recipeData');

// CollectionReference favoriteRecipesReference = FirebaseFirestore.instance
//     .collection('users')
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('favoriteRecipes');

// CollectionReference dietGoalsReference = FirebaseFirestore.instance
//     .collection('users')
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('dietGoals');

// CollectionReference deletedDietGoalsReference = FirebaseFirestore.instance
//     .collection('users')
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('deletedDietGoals');

// DocumentReference userBehaviorReference = FirebaseFirestore.instance
//     .collection('users')
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('userBehavior')
//     .doc('userBehavior');

// DocumentReference paulaStatementsReference = FirebaseFirestore.instance
//     .collection("users")
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('paulaStatements')
//     .doc('paulaStatements');

// CollectionReference surveyQuestionsPre = FirebaseFirestore.instance
//     .collection("users")
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('surveyAnswersPre');

// CollectionReference surveyQuestionsPost = FirebaseFirestore.instance
//     .collection("users")
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('surveyAnswers');
// CollectionReference emissionStats = FirebaseFirestore.instance
//     .collection("users")
//     .doc(FirebaseAuth.instance.currentUser!.uid)
//     .collection('emissionStats');

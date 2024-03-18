import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final int? currentBackground, currentPaula, ecoPoints, dietType, interventionDay;
  final String? loginDate, email;
  final bool? completionDaily, completionStatus, preQuestionnaireFinished, studyCompleted, updatedBackground, loginDateSubmitted, paulaStatementsInitial, isFirstLaunch, dailyRecipesGenerated, feedbackReceived, pushNotificationsEnabled, ecoPointsReceived, followUpCompleted;
  final Map<String, int>? dailyRecipes;
  final List<int>? recipeIDs;
  
  const UserData(this.currentBackground, this.currentPaula, this.loginDate, this.paulaStatementsInitial, this.completionDaily, this.completionStatus, this.preQuestionnaireFinished, this.studyCompleted, this.updatedBackground, this.loginDateSubmitted, this.isFirstLaunch, this.dailyRecipesGenerated, this.dailyRecipes, this.feedbackReceived, this.recipeIDs, this.pushNotificationsEnabled, this.ecoPoints, this.dietType, this.ecoPointsReceived, this.followUpCompleted, this.email, this.interventionDay);

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
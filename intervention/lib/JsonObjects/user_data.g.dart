// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['currentBackground'] as int?,
      json['currentPaula'] as int?,
      json['loginDate'] as String?,
      json['paulaStatementsInitial'] as bool?,
      json['completionDaily'] as bool?,
      json['completionStatus'] as bool?,
      json['preQuestionnaireFinished'] as bool?,
      json['studyCompleted'] as bool?,
      json['updatedBackground'] as bool?,
      json['loginDateSubmitted'] as bool?,
      json['isFirstLaunch'] as bool?,
      json['dailyRecipesGenerated'] as bool?,
      (json['dailyRecipes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      json['feedbackReceived'] as bool?,
      (json['recipeIDs'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['pushNotificationsEnabled'] as bool?,
      json['ecoPoints'] as int?,
      json['dietType'] as int?,
      json['ecoPointsReceived'] as bool?,
      json['followUpCompleted'] as bool?,
      json['email'] as String?,
      json['interventionDay'] as int?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'currentBackground': instance.currentBackground,
      'currentPaula': instance.currentPaula,
      'ecoPoints': instance.ecoPoints,
      'dietType': instance.dietType,
      'interventionDay': instance.interventionDay,
      'loginDate': instance.loginDate,
      'email': instance.email,
      'completionDaily': instance.completionDaily,
      'completionStatus': instance.completionStatus,
      'preQuestionnaireFinished': instance.preQuestionnaireFinished,
      'studyCompleted': instance.studyCompleted,
      'updatedBackground': instance.updatedBackground,
      'loginDateSubmitted': instance.loginDateSubmitted,
      'paulaStatementsInitial': instance.paulaStatementsInitial,
      'isFirstLaunch': instance.isFirstLaunch,
      'dailyRecipesGenerated': instance.dailyRecipesGenerated,
      'feedbackReceived': instance.feedbackReceived,
      'pushNotificationsEnabled': instance.pushNotificationsEnabled,
      'ecoPointsReceived': instance.ecoPointsReceived,
      'followUpCompleted': instance.followUpCompleted,
      'dailyRecipes': instance.dailyRecipes,
      'recipeIDs': instance.recipeIDs,
    };

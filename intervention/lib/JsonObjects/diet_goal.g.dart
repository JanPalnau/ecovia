// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietGoal _$DietGoalFromJson(Map<String, dynamic> json) => DietGoal(
      json['id'] as int?,
      json['what'] as String?,
      json['where'] as String?,
      json['when'] as String?,
      json['how'] as String?,
      json['barriers'] as String?,
      json['alternative'] as String?,
      json['ifStatement'] as String?,
      json['thenStatement'] as String?,
      DateTime.parse(json['creationDate'] as String),
      json['isFinished'] as bool,
    );

Map<String, dynamic> _$DietGoalToJson(DietGoal instance) => <String, dynamic>{
      'isFinished': instance.isFinished,
      'creationDate': instance.creationDate.toIso8601String(),
      'id': instance.id,
      'what': instance.what,
      'where': instance.where,
      'when': instance.when,
      'how': instance.how,
      'barriers': instance.barriers,
      'alternative': instance.alternative,
      'ifStatement': instance.ifStatement,
      'thenStatement': instance.thenStatement,
    };

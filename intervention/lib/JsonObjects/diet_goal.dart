import 'package:json_annotation/json_annotation.dart';

part 'diet_goal.g.dart';

@JsonSerializable()
class DietGoal {
  final bool isFinished;
  final DateTime creationDate;
  final int? id;
  final String? what, where, when, how, barriers, alternative, ifStatement, thenStatement;

  DietGoal(this.id, this.what, this.where, this.when, this.how, this.barriers, this.alternative, this.ifStatement, this.thenStatement, this.creationDate, this.isFinished
    
  );

  factory DietGoal.fromJson(Map<String, dynamic> json) =>
      _$DietGoalFromJson(json);

  Map<String, dynamic> toJson() => _$DietGoalToJson(this);
}

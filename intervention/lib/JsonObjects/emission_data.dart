
import 'package:json_annotation/json_annotation.dart';

part 'emission_data.g.dart';

@JsonSerializable()
class EmissionData {
 final double? alcDrinks, animalCheese, animalCream, animalDeli, animalJogurt, animalMilk, beef, bread, butter, cereal, eggs, fish, fruits, legumes, margarine, meatSubstitutes, nuts, pasta, plantCheese, plantCream, plantDeli, plantJogurt, plantMilk, pork, potatoes, poultry, rice, saltySnacks, sausages, spread, tea, tofu, vegetables;

  EmissionData(this.alcDrinks, this.animalCheese, this.animalCream, this.animalDeli, this.animalJogurt, this.animalMilk, this.beef, this.bread, this.butter, this.cereal, this.eggs, this.fish, this.fruits, this.legumes, this.margarine, this.meatSubstitutes, this.nuts, this.pasta, this.plantCheese, this.plantCream, this.plantDeli, this.plantJogurt, this.plantMilk, this.pork, this.potatoes, this.poultry, this.rice, this.saltySnacks, this.sausages, this.spread, this.tea, this.tofu, this.vegetables);

  factory EmissionData.fromJson(Map<String, dynamic> json) => _$EmissionDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmissionDataToJson(this);
 
}
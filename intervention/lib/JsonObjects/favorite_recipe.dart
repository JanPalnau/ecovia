import 'package:json_annotation/json_annotation.dart';

part 'favorite_recipe.g.dart';

@JsonSerializable()
class FavoriteRecipe {
  final int? id;
  final bool? isFavorized;

  FavoriteRecipe(
    this.id,
    this.isFavorized,
  );

  factory FavoriteRecipe.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteRecipeToJson(this);
}

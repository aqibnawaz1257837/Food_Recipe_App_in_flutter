// To parse this JSON data, do
//
//     final chickenmodel = chickenmodelFromJson(jsonString);

import 'dart:convert';

Chickenmodel chickenmodelFromJson(String str) => Chickenmodel.fromJson(json.decode(str));

String chickenmodelToJson(Chickenmodel data) => json.encode(data.toJson());

class Chickenmodel {
  Chickenmodel({
    required this.meals,
  });

  List<Meal> meals;

  factory Chickenmodel.fromJson(Map<String, dynamic> json) => Chickenmodel(
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  String strMeal;
  String strMealThumb;
  String idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}

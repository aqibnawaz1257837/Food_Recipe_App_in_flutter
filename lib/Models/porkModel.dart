// To parse this JSON data, do
//
//     final porkmodel = porkmodelFromJson(jsonString);

import 'dart:convert';

Porkmodel porkmodelFromJson(String str) => Porkmodel.fromJson(json.decode(str));

String porkmodelToJson(Porkmodel data) => json.encode(data.toJson());

class Porkmodel {
  Porkmodel({
    required this.meals,
  });

  List<Meal> meals;

  factory Porkmodel.fromJson(Map<String, dynamic> json) => Porkmodel(
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

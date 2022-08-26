import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mealdbinflutter/Models/beefModel.dart';
import 'package:mealdbinflutter/Models/chickenModel.dart';
import 'package:mealdbinflutter/Models/porkModel.dart';



class Services{

  static Future<dynamic> getAlcholicCocktailResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getcategoryResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getchickenResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Chickenmodel respone = chickenmodelFromJson(res);
      return respone;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }


  static Future<dynamic> getCocktailProperResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }


  static Future<dynamic> getCocktailResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getbeefResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?i=beef'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Models respone = modelsFromJson(res);
      return respone;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }


  static Future<dynamic> getFilterImealResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?i'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getmealsResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return jsonDecode(res);

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getamealsResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=Breakfast'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return jsonDecode(res);

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }


  static Future<dynamic> getNonAlcholicCocktailResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getpopularCocktailResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getporkResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?i=pork'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Porkmodel respone = porkmodelFromJson(res);
      return respone;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getrandomResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getrandomCocktailResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

  static Future<dynamic> getSeafoodmealResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }

}

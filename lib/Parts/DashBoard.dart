import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealdbinflutter/Demo_Sliders.dart';
import 'package:mealdbinflutter/Models/beefModel.dart';
import 'package:mealdbinflutter/Models/chickenModel.dart';
import 'package:mealdbinflutter/Models/porkModel.dart';
import 'package:mealdbinflutter/Parts/DashBoardSlider.dart';
import 'package:mealdbinflutter/Screens/CocktailDetailedPage.dart';
import 'package:mealdbinflutter/Screens/Detailed_page.dart';
import 'package:mealdbinflutter/Services/Services.dart';


class DashBoard extends StatefulWidget {

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Models? models;
  Chickenmodel? chickenmodel;
  Porkmodel? porkmodel;


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String myId = '';
  String myUsername = '';
  String myUrlAvatar = '';

  List l =[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: PageScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[




            // SizedBox(height: 35.0,),

            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 12.w , bottom: 10.h),
              child: Text("BreakFast" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
            ),


            TestingSliderDemo(),


            FutureBuilder(
              future: Services.getbeefResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {


                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  models = snapshot.data;


                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                        child: Text("Beef category" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),

                      Container(
                        height: 100.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: models!.meals.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Padding(
                                padding: EdgeInsets.all(7.0.h),
                                child: Container(
                                  width: 160.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xfffa7e21),
                                            blurStyle: BlurStyle.outer,
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: Offset(0.5,1)
                                        )
                                      ]

                                  ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: NetworkImage("${models!.meals[index].strMealThumb}"),
                                        radius: 60.r,
                                      ),
                                      SizedBox(height: 5.h,),
                                      Text("${models!.meals[index].strMeal}"),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },),
                      ),



                    ],
                  );


                }


                return Container();

              },),

            FutureBuilder(
              future: Services.getCocktailResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {


                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  Map m= jsonDecode(snapshot.data);

                  List l=m['drinks'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                        child: Text("Cocktail Drinks" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),

                      Container(
                        height: 100.h,
                        child: ListView.builder(
                          itemCount: l.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(7.h),
                              child: Container(
                                width: 160.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfffa7e21),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(0.5,1)
                                      )
                                    ]

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${l[index]['strDrinkThumb']}"),
                                      radius: 60.r,
                                    ),
                                    SizedBox(height: 5.h),
                                    Text("${l[index]['strDrink']}"),

                                  ],
                                ),
                              ),
                            );
                          },),
                      ),



                    ],
                  );


                }


                return Container();

              },),

            FutureBuilder(
              future: Services.getchickenResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {


                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  chickenmodel = snapshot.data;


                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 15.h , left: 12.w , bottom: 5.h),
                        child: Text("Chicken category" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),

                      Container(
                        height: 100.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: chickenmodel!.meals.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(7.h),
                              child: Container(
                                width: 160.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfffa7e21),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(0.5,1)
                                      )
                                    ]

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${chickenmodel!.meals[index].strMealThumb}"),
                                      radius: 60.r,
                                    ),
                                    SizedBox(height: 5.sp,),
                                    Text("${chickenmodel!.meals[index].strMeal}"),

                                  ],
                                ),
                              ),
                            );
                          },),
                      ),



                    ],
                  );


                }


                return Container();

              },),

            FutureBuilder(
              future: Services.getNonAlcholicCocktailResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {


                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  Map m= jsonDecode(snapshot.data);

                  List l=m['drinks'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                        child: Text("Non-Alcoholic Drinks" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),

                      Container(
                        height: 100.h,
                        child: ListView.builder(
                          itemCount: l.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(7.h),
                              child: Container(
                                width: 160.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfffa7e21),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(0.5,1)
                                      )
                                    ]

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${l[index]['strDrinkThumb']}"),
                                      radius: 60.r,
                                    ),
                                    SizedBox(height: 5.h),
                                    Text("${l[index]['strDrink']}"),

                                  ],
                                ),
                              ),
                            );
                          },),
                      ),



                    ],
                  );


                }


                return Container();

              },),

            FutureBuilder(
              future: Services.getporkResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {


                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  porkmodel = snapshot.data;


                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                        child: Text("Pork category" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),

                      Container(
                        height: 100.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: porkmodel!.meals.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(7.h),
                              child: Container(
                                width: 160.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfffa7e21),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(0.5,1)
                                      )
                                    ]

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${porkmodel!.meals[index].strMealThumb}"),
                                      radius: 60.r,
                                    ),
                                    SizedBox(height: 5.h),
                                    Text("${porkmodel!.meals[index].strMeal}"),

                                  ],
                                ),
                              ),
                            );
                          },),
                      ),



                    ],
                  );


                }


                return Container();

              },),


            Row(
              children: <Widget>[

                FutureBuilder(
                  future: Services.getrandomResponse(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {


                    if(snapshot.hasError){
                      return Text("There is some Error");
                    }
                    if(snapshot.hasData){

                      Map m= jsonDecode(snapshot.data);

                      List l=m['meals'];

                      Map obj=l[0];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Padding(
                            padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                            child: Text("Random Dish" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                          ),

                          InkWell(
                            onTap:(){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Detailed_page(
                                    text1: "${obj['strMeal']}",
                                    image: "${obj['strMealThumb']}",
                                    text2: "${obj['strArea']}",
                                    text3: "${obj['strInstructions']}",
                                    text4: "${obj['strTags']}",
                                    ing1: "${obj['strIngredient1']}",
                                    ing2: "${obj['strIngredient2']}",
                                    ing3: "${obj['strIngredient3']}",
                                    ing4: "${obj['strIngredient4']}",
                                    ing5: "${obj['strIngredient5']}",
                                    ing6: "${obj['strIngredient6']}",
                                    ing7: "${obj['strIngredient7']}",
                                    ing8: "${obj['strIngredient8']}",
                                    ing9: "${obj['strIngredient9']}",
                                    ing10: "${obj['strIngredient10']}",
                                    ing11: "${obj['strIngredient11']}",
                                    ing12: "${obj['strIngredient12']}",
                                    ing13: "${obj['strIngredient13']}",
                                    mea1: "${obj['strMeasure1']}",
                                    mea2: "${obj['strMeasure2']}",
                                    mea3: "${obj['strMeasure3']}",
                                    mea4: "${obj['strMeasure4']}",
                                    mea5: "${obj['strMeasure5']}",
                                    mea6: "${obj['strMeasure6']}",
                                    mea7: "${obj['strMeasure7']}",
                                    mea8: "${obj['strMeasure8']}",
                                    mea9: "${obj['strMeasure9']}",
                                    mea10: "${obj['strMeasure10']}",
                                    mea11: "${obj['strMeasure11']}",
                                    mea12: "${obj['strMeasure12']}",
                                    mea13: "${obj['strMeasure13']}",
                                  )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12 , left: 18),
                              child: Container(
                                height: 80.h,
                                width: 148.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfffa7e21),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(0.5,1)
                                      )
                                    ]

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${obj['strMealThumb']}"),
                                      radius: 60.r,
                                    ),
                                    SizedBox(height: 5.h),
                                    Text("${obj['strMeal']}" , style: TextStyle(fontSize: 12.sp),),

                                  ],
                                ),
                              ),
                            ),
                          ),



                        ],
                      );


                    }


                    return Container();

                  },),
                FutureBuilder(
                  future: Services.getrandomCocktailResponse(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {


                    if(snapshot.hasError){
                      return Text("There is some Error");
                    }
                    if(snapshot.hasData){

                      Map m= jsonDecode(snapshot.data);

                      List l=m['drinks'];

                      Map obj=l[0];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Padding(
                            padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                            child: Text("" , style: TextStyle(color: Colors.white , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                          ),

                          InkWell(
                            onTap: (){

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => CocktailDetailedPage(
                                    image1: "${obj['strDrinkThumb']}",
                                    text1: "${obj['strDrink']}",
                                    text2: "${obj['strCategory']}",
                                    text3: "${obj['strAlcoholic']}",
                                    text4: "${obj['strGlass']}",
                                    text5: "${obj['strInstructions']}",
                                    text6: "${obj['strInstructionsDE']}",
                                    text7: "${obj['strInstructionsIT']}",
                                    ing1: "${obj['strIngredient1']}",
                                    ing2: "${obj['strIngredient2']}",
                                    ing3: "${obj['strIngredient3']}",
                                    ing4: "${obj['strIngredient4']}",
                                    ing5: "${obj['strIngredient5']}",
                                    ing6: "${obj['strIngredient6']}",
                                    ing7: "${obj['strIngredient7']}",
                                    mea1: "${obj['strMeasure1']}",
                                    mea2: "${obj['strMeasure2']}",
                                    mea3: "${obj['strMeasure3']}",
                                    mea4: "${obj['strMeasure4']}",
                                    mea5: "${obj['strMeasure5']}",
                                    mea6: "${obj['strMeasure6']}",
                                    mea7: "${obj['strMeasure7']}",

                                  )
                                  )
                              );

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12 , left: 14),
                              child: Container(
                                height: 80.h,
                                width: 148.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfffa7e21),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(0.5,1)
                                      )
                                    ]

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${obj['strDrinkThumb']}"),
                                      radius: 60.r,
                                    ),
                                    SizedBox(height: 5.h),
                                    Text("${obj['strDrink']}" , style: TextStyle(fontSize: 12.sp),),

                                  ],
                                ),
                              ),
                            ),
                          ),



                        ],
                      );


                    }


                    return Container();

                  },),

              ],
            ),

            FutureBuilder(
              future: Services.getcategoryResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {


                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  Map m= jsonDecode(snapshot.data);

                  List l=m['categories'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                        child: Text("Category List" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),

                      Container(
                        height: 100.h,
                        child: ListView.builder(
                          itemCount: l.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(7.h),
                              child: Container(
                                width: 160.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfffa7e21),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(0.5,1)
                                      )
                                    ]

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${l[index]['strCategoryThumb']}"),
                                      radius: 60.r,
                                    ),
                                    SizedBox(height: 5.h),
                                    Text("${l[index]['strCategory']}"),

                                  ],
                                ),
                              ),
                            );
                          },),
                      ),



                    ],
                  );


                }


                return Container();

              },),


            FutureBuilder(
              future: Services.getSeafoodmealResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {


                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  Map m= jsonDecode(snapshot.data);

                  List l=m['meals'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                        child: Text("Seafood List" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),

                      Container(
                        height: 100.h,
                        child: ListView.builder(
                          itemCount: l.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(7.h),
                              child: Container(
                                width: 160.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfffa7e21),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(0.5,1)
                                      )
                                    ]

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${l[index]['strMealThumb']}"),
                                      radius: 60.r,
                                    ),
                                    SizedBox(height: 5.h),
                                    Text("${l[index]['strMeal']}"),

                                  ],
                                ),
                              ),
                            );
                          },),
                      ),



                    ],
                  );


                }


                return Container();

              },),

            FutureBuilder(
              future: Services.getAlcholicCocktailResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {


                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  Map m= jsonDecode(snapshot.data);

                  List l=m['drinks'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                        child: Text("Alcoholic Drinks" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),

                      Container(
                        height: 100.h,
                        child: ListView.builder(
                          itemCount: l.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(7.h),
                              child: Container(
                                width: 160.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xfffa7e21),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(0.5,1)
                                      )
                                    ]

                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("${l[index]['strDrinkThumb']}"),
                                      radius: 60.r,
                                    ),
                                    SizedBox(height: 5.h),
                                    Text("${l[index]['strDrink']}"),

                                  ],
                                ),
                              ),
                            );
                          },),
                      ),

                    ],
                  );
                }
                return Container();
              },),


            FutureBuilder(
              future: Services.getFilterImealResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                final List<Widget> imageSliders = l
                    .map((item) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(item["strMealThumb"], fit: BoxFit.cover, width: 1000.0),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Text(
                                  '${item["strMeal"]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ))
                    .toList();
                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  Map m= jsonDecode(snapshot.data);
                  l=m['meals'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                        child: Text("Feature Meals" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),


                      Container(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.vertical,
                              autoPlay: true,
                            ),
                            items: imageSliders,
                          )),
                    ],
                  );
                }
                return Container();
              },),

            FutureBuilder(
              future: Services.getpopularCocktailResponse(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {


                if(snapshot.hasError){
                  return Text("There is some Error");
                }
                if(snapshot.hasData){

                  Map m= jsonDecode(snapshot.data);

                  List l1=m['drinks'];

                  final List<Widget> imageSliders = l1
                      .map((item) => Container(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(item["strDrinkThumb"], fit: BoxFit.cover, width: 1000.0),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Text(
                                    '${item["strDrink"]}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ))
                      .toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 12.w , bottom: 5.h),
                        child: Text("Feature Drinks" , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.bold),),
                      ),


                      Container(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.vertical,
                              autoPlay: true,
                            ),
                            items: imageSliders,
                          )),
                    ],
                  );


                }


                return Container();

              },),


          ],
      ),
    );
  }}




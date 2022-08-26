import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealdbinflutter/Models/Meals.dart';
import 'package:mealdbinflutter/Models/beefModel.dart';
import 'package:mealdbinflutter/Models/chickenModel.dart';
import 'package:mealdbinflutter/Models/porkModel.dart';
import 'package:mealdbinflutter/Parts/DashBoard.dart';
import 'package:mealdbinflutter/Screens/CocktailDetailedPage.dart';
import 'package:mealdbinflutter/Screens/Detailed_page.dart';
import 'package:mealdbinflutter/Screens/Login.dart';
import 'package:mealdbinflutter/Screens/SpleashScreen.dart';
import 'package:mealdbinflutter/Screens/Welcome.dart';
import 'package:mealdbinflutter/Services/Services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Firestore CRUD by Aqib',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        }
        return CircularProgressIndicator();
      },
    );

  }
}


class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(330, 360),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xfffa7e21),
        title: Text("Meal Db"),
        centerTitle: true,
      ),



      drawer: Drawer(
        child: ListView(
          children: <Widget>[


            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xfffa7e21),

      ),
                accountName: Text("Aqib Nawaz"),
                accountEmail: Text("aqibnawaz015@gmail.com"),
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://media.cvrest.com/image/247aee11dc959bef7a33b25d23b5768ainf6wczodbntmdmkcll7.jpg/w/400"),),
            ),
            ListTile(
              title: Text("Profile"),
            ),
            Column(
              children: <Widget>[

                FutureBuilder(
                  future: Services.getmealsResponse(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {


                    if(snapshot.hasError){
                      return Text("There is some Error");
                    }
                    if(snapshot.hasData){


                      Map m=snapshot.data;

                      List l=m['meals'];

                      return Container(
                          child: ExpansionTile(
                            title: Text("Meals"),
                            subtitle: Text("See More Details"),
                            children: <Widget>[

                              Container(
                                height:600,
                                child: ListView.builder(
                                  itemCount:l.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => Detailed_page(
                                              text1: "${l[index]['strMeal']}",
                                              image: "${l[index]['strMealThumb']}",
                                              text2: "${l[index]['strArea']}",
                                              text3: "${l[index]['strInstructions']}",
                                              text4: "${l[index]['strTags']}",
                                              ing1: "${l[index]['strIngredient1']}",
                                              ing2: "${l[index]['strIngredient2']}",
                                              ing3: "${l[index]['strIngredient3']}",
                                              ing4: "${l[index]['strIngredient4']}",
                                              ing5: "${l[index]['strIngredient5']}",
                                              ing6: "${l[index]['strIngredient6']}",
                                              ing7: "${l[index]['strIngredient7']}",
                                              ing8: "${l[index]['strIngredient8']}",
                                              ing9: "${l[index]['strIngredient9']}",
                                              ing10: "${l[index]['strIngredient10']}",
                                              ing11: "${l[index]['strIngredient11']}",
                                              ing12: "${l[index]['strIngredient12']}",
                                              ing13: "${l[index]['strIngredient13']}",
                                              mea1: "${l[index]['strMeasure1']}",
                                              mea2: "${l[index]['strMeasure2']}",
                                              mea3: "${l[index]['strMeasure3']}",
                                              mea4: "${l[index]['strMeasure4']}",
                                              mea5: "${l[index]['strMeasure5']}",
                                              mea6: "${l[index]['strMeasure6']}",
                                              mea7: "${l[index]['strMeasure7']}",
                                              mea8: "${l[index]['strMeasure8']}",
                                              mea9: "${l[index]['strMeasure9']}",
                                              mea10: "${l[index]['strMeasure10']}",
                                              mea11: "${l[index]['strMeasure11']}",
                                              mea12: "${l[index]['strMeasure12']}",
                                              mea13: "${l[index]['strMeasure13']}",
                                            ),
                                            )
                                        );
                                      },
                                      child: ListTile(
                                        title: Text("${l[index]['strMeal']}"),
                                        subtitle: Text("${l[index]['strArea']}"),
                                      ),
                                    );
                                  },),
                              ),
                            ],
                          )
                      );


                    }


                    return Container();

                  },),
                FutureBuilder(
                  future: Services.getCocktailProperResponse(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {


                    if(snapshot.hasError){
                      return Text("There is some Error");
                    }
                    if(snapshot.hasData){


                      Map m=jsonDecode(snapshot.data);

                      List l=m['drinks'];

                      print("${l.length}");

                      return Container(
                          child: ExpansionTile(
                            title: Text("Drinks"),
                            subtitle: Text("See More Details"),
                            children: <Widget>[

                              Container(
                                height:600,
                                child: ListView.builder(
                                  itemCount:l.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => CocktailDetailedPage(
                                              image1: "${l[index]['strDrinkThumb']}",
                                              text1: "${l[index]['strDrink']}",
                                              text2: "${l[index]['strCategory']}",
                                              text3: "${l[index]['strAlcoholic']}",
                                              text4: "${l[index]['strGlass']}",
                                              text5: "${l[index]['strInstructions']}",
                                              text6: "${l[index]['strInstructionsDE']}",
                                              text7: "${l[index]['strInstructionsIT']}",
                                              ing1: "${l[index]['strIngredient1']}",
                                              ing2: "${l[index]['strIngredient2']}",
                                              ing3: "${l[index]['strIngredient3']}",
                                              ing4: "${l[index]['strIngredient4']}",
                                              ing5: "${l[index]['strIngredient5']}",
                                              ing6: "${l[index]['strIngredient6']}",
                                              ing7: "${l[index]['strIngredient7']}",
                                              mea1: "${l[index]['strMeasure1']}",
                                              mea2: "${l[index]['strMeasure2']}",
                                              mea3: "${l[index]['strMeasure3']}",
                                              mea4: "${l[index]['strMeasure4']}",
                                              mea5: "${l[index]['strMeasure5']}",
                                              mea6: "${l[index]['strMeasure6']}",
                                              mea7: "${l[index]['strMeasure7']}",

                                            )
                                            )
                                        );


                                      },
                                      child: ListTile(
                                        title: Text("${l[index]['strDrink']}"),
                                        subtitle: Text("${l[index]['strAlcoholic']}"),
                                      ),
                                    );
                                  },),
                              ),
                            ],
                          )
                      );


                    }


                    return Container();

                  },),


                GestureDetector(

                  onTap: (){
                    logout();
                  },

                  child: ListTile(
                    title: Text("Logout"),
                  ),
                )


              ],
            ),





          ],
        )
      ),

      body: DashBoard()
    );

  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Welcome()));
      //await googleSignIn.signOut();
      print("User Sign Out");
    } catch (e, st) {
      FlutterError.reportError(FlutterErrorDetails(exception: e, stack: st));
    }
  }



}

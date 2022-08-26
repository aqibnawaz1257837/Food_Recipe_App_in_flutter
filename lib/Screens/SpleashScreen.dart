import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mealdbinflutter/Screens/Welcome.dart';

import '../main.dart';



class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    User? user = FirebaseAuth.instance.currentUser;



    Timer(Duration(seconds: 4),()=> Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {


          if(user!= null){

            return MyHome();

          }
          else
          {
            return Welcome();

          }
    })));

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xfffa7e21),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Lottie.asset("assets/a.json"),

            SizedBox(height: 10.0,),

            Text("Meal DB" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 28.0),)


          ],
        ),
      ),
    );



  }
}

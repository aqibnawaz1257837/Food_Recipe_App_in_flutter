import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mealdbinflutter/Screens/Login.dart';
import 'package:mealdbinflutter/Screens/SignUp.dart';
import 'package:mealdbinflutter/main.dart';



class Welcome extends StatefulWidget {

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: <Widget>[


          Image.asset("images/abc.jpg" ,fit: BoxFit.fitHeight
            ,),

          Container(
            color: Color(0xd5fa7e21),
          ),


          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[





              Container(
                width: 350,

                  child: Lottie.asset("assets/a.json")),


              Text("Recipe Applicaiton" , style: TextStyle(
                  color: Colors.white ,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                fontFamily: "Times New Roman",
                letterSpacing: 2
              ),),
              SizedBox(
                height: 100.0,
              ),

              GestureDetector(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (c)=> SignUp()));
                },
                child: Container(
                  width: 300,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.white70 , width: 2)
                  ),
                  child: Center(child: Text("Sign Up" , style: TextStyle(
                      color: Colors.white,
                      fontSize: 18 ,
                      letterSpacing: 2 ,
                      fontWeight: FontWeight.bold),)),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginPage()));

                },
                child: Container(
                  width: 300,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(child: Text("Login" , style: TextStyle(
                      color: Color(0xfffa7e21),
                      fontSize: 18 ,
                      letterSpacing: 2 ,
                      fontWeight: FontWeight.bold),)),
                ),
              ),




            ],
          ),

        ],
      ),
    );
  }
}

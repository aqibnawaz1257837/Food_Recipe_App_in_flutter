import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:mealdbinflutter/googlesignin.dart';
import 'package:mealdbinflutter/main.dart';


class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  TextEditingController textEditingControlleremail = TextEditingController();
  TextEditingController textEditingControllerpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }


  void _getdata() async {
    // FirebaseFirestore.instance
    //     .collection('User_Created')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //
    //   querySnapshot.docs.forEach((doc) {
    //     print(doc["first_name"]);
    //   });

    FirebaseFirestore.instance
        .collection('User_Created')
        .where('Email', isEqualTo: "murtuza@gmail.com")
        .get()
        .then((value) => print("gagaggag ${value.docs.first['Name']}"));
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
            color: Color(0xd8e3dddd),
          ),
          Positioned(
            left: 1,
            top: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
              child: IconButton(

                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 24,

                ),
              ),
            ),
          ),

          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[



                Container(
                  width: 300.0,
                  child: Lottie.asset("assets/a.json"),

                ),

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: EdgeInsets.only(top:10 , right: 10, left: 10),
                  child: TextFormField(
                    controller: textEditingControlleremail,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 14),
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "email@gmail.com",
                      hintStyle:TextStyle(fontSize: 14),

                      labelStyle: TextStyle(fontSize: 14) ,
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 14 , color: Colors.redAccent) ,
                    ),


                    validator: (value){

                      if(value == null || value.isEmpty){

                        return "PLease Enter the Email";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top:10 , right: 10 , left: 10),

                  child: TextFormField(
                    controller: textEditingControllerpassword,
                    style: TextStyle(fontSize: 14),
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "********",
                      hintStyle:TextStyle(fontSize: 14),
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 14) ,
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 14 , color: Colors.redAccent) ,
                    ),

                    validator: (value){

                      if(value == null || value.isEmpty){

                        return "PLease Enter the Password";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: (){

                    if(_formKey.currentState!.validate()){


                      _LoginUser().then((value){


                        if(value == 1){

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Signin Successfully")));
                          clearText();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHome()));

                        }


                        else{

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is some Error")));


                        }


                      });


                    }

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

                SizedBox(
                  height: 20.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[


                    Container(
                      width: 100,
                      child: Divider(
                        thickness: 1,
                        color: Color(0xf27d7d7d),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("OR Connect With:"),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 100,
                      child: Divider(
                        thickness: 1,
                        color: Color(0xf27d7d7d),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[


                            Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.white,
                            ),

                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Facebook" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 18),)

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GoogleSiginPage()));
                      },
                      child: Container(
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[


                              Icon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),

                              SizedBox(
                                width: 10.0,
                              ),
                              Text("Google" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 18),)

                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),


              ],
            ),
          ),

        ],

      ),
    );
  }




  Future<int> _LoginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: textEditingControlleremail.text.trim(),
          password: textEditingControllerpassword.text.trim()
      );
      return 1;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${e.message}")));

      return 0;
    }
  }


  clearText() {
    textEditingControlleremail.clear();
    textEditingControllerpassword.clear();
  }


  // Future signInWithGoogle() async {
  //
  //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //
  //   String userUid;
  //
  //   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //   await googleSignInAccount!.authentication;
  //   final AuthCredential authCredential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken);
  //
  //   final UserCredential userCredential =
  //   await firebaseAuth.signInWithCredential(authCredential);
  //   final User? user = userCredential.user;
  //   assert(user!.uid != null);
  //
  //   userUid = user!.uid;
  //   print('Google User Uid => $userUid');
  //
  //
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHome()));
  //
  // }


}

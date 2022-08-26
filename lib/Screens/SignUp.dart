import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:mealdbinflutter/Screens/Login.dart';



class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  TextEditingController textEditingControllername = TextEditingController();
  TextEditingController textEditingControllerPass = TextEditingController();
  TextEditingController textEditingControlleremail = TextEditingController();
  TextEditingController textEditingControllerphone = TextEditingController();
  TextEditingController textEditingControllerCNic = TextEditingController();
  TextEditingController textEditingControllerAddress = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  CollectionReference UserCreated =
  FirebaseFirestore.instance.collection('User_Created');

  var name ="";
  var email ="";
  var password ="";
  var phone ="";
  var Cnic ="";
  var address ="";




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

          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


                  Padding(
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
                  SizedBox(
                    height: 50.0,
                  ),

                  Center(
                    child: Container(
                      width: 300.0,
                      child: Lottie.asset("assets/a.json"),

                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),



                  Padding(
                    padding: EdgeInsets.only(top:10 , right: 10, left: 10),
                    child: TextFormField(
                      controller: textEditingControllername,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 14),
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        hintText: "Full Name",
                        hintStyle:TextStyle(fontSize: 14),

                        labelStyle: TextStyle(fontSize: 14) ,
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(fontSize: 14 , color: Colors.redAccent) ,
                      ),


                      validator: (value){

                        if(value == null || value.isEmpty){

                          return "Please Enter the Name";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
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

                          return "PLease Enter the email";
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
                      obscureText: true,
                      controller: textEditingControllerPass,
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.visiblePassword,
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

                  Padding(
                    padding: EdgeInsets.only(top:10 , right: 10 , left: 10),

                    child: TextFormField(
                      controller: textEditingControllerphone,
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "347-********",
                        hintStyle:TextStyle(fontSize: 14),
                        labelText: "Phone",
                        labelStyle: TextStyle(fontSize: 14) ,
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(fontSize: 14 , color: Colors.redAccent) ,
                      ),

                      validator: (value){

                        if(value == null || value.isEmpty){

                          return "PLease Enter the Phone no";
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
                      controller: textEditingControllerCNic,
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "42101-********-*",
                        hintStyle:TextStyle(fontSize: 14),
                        labelText: "CNIC No",
                        labelStyle: TextStyle(fontSize: 14) ,
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(fontSize: 14 , color: Colors.redAccent) ,
                      ),

                      validator: (value){

                        if(value == null || value.isEmpty){

                          return "PLease Enter the Cnic no";
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
                      controller: textEditingControllerAddress,
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Address",
                        hintStyle:TextStyle(fontSize: 14),
                        labelText: "Address",
                        labelStyle: TextStyle(fontSize: 14) ,
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(fontSize: 14 , color: Colors.redAccent) ,
                      ),

                      validator: (value){

                        if(value == null || value.isEmpty){

                          return "PLease Enter the Address";
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




                  Center(
                    child: GestureDetector(
                      onTap: (){


                        if(_formKey.currentState!.validate()){


                          setState(() {
                            name = textEditingControllername.text;
                            email = textEditingControlleremail.text;
                            password = textEditingControllerPass.text;
                            phone = textEditingControllerphone.text;
                            Cnic = textEditingControllerCNic.text;
                            address = textEditingControllerAddress.text;
                          });

                          _CreateUserAccount().then((value){

                            if(value == 1){

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Created Successfully")));
                              clearText();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));


                            }
                            else{

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("There is some Error")));

                            }

                          });

                        }


                        // Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginPage()));

                      },
                      child: Container(
                        width: 300,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(child: Text("Register" , style: TextStyle(
                            color: Color(0xfffa7e21),
                            fontSize: 18 ,
                            letterSpacing: 2 ,
                            fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ),




                ],
              ),
            ),
          ),

        ],

      ),
    );
  }




  Future<int> _CreateUserAccount() async {
    try {
      UserCreated.add({
        'Name':name , 'Email':email ,'Password':password ,'Phone':phone ,'Cnic_no':Cnic ,'Address':address ,
      });

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: textEditingControlleremail.text.trim(),
          password: textEditingControllerPass.text.trim()
      );
      return 1;
    } on FirebaseAuthException catch  (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.message}")));

      return 0;
    }

    // await _auth.createUserWithEmailAndPassword(
    //   email: emailController.text.trim(),
    //   password: passController.text.trim(),
    // );
  }

  clearText() {
    textEditingControlleremail.clear();
    textEditingControllerPass.clear();
    textEditingControllerphone.clear();
    textEditingControllername.clear();
    textEditingControllerCNic.clear();
    textEditingControllerAddress.clear();

  }
}


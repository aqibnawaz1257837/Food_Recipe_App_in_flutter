import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ]
);

class GoogleSiginPage extends StatefulWidget {
  const GoogleSiginPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<GoogleSiginPage> {

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Sign in'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                  AssetImage('assets/weddinglogo.png'),
                ),),),
            Container(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 15, left: 10, right: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Login", style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 25),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 14, left: 14, bottom: 8),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius
                                    .all(
                                    Radius.circular(15)),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding: EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                            ),
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            inputFormatters: [

                            ],),),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, right: 14, left: 14, bottom: 8),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius
                                    .all(
                                    Radius.circular(15)),
                              ),
                              hintText: "Password",
                              contentPadding: EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              hintStyle: TextStyle(fontSize: 15),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.add
                                ),

                                  onPressed: () {

                                  }),),
                            cursorColor: Colors.black,
                            inputFormatters: [
                            ],),),
                        SizedBox(height: 16,),
                        InkWell(
                          child: Container(
                              margin: EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black
                              ),
                              child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                              AssetImage('assets/google.jpg'),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Text('Sign in with Google',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ],
                                  )
                              )
                          ),
                          onTap: (){}
                        ),
                        SizedBox(height: 16,),
                      ],),
                  ),),
              ),),
          ],),
      ),
    );
  }
}
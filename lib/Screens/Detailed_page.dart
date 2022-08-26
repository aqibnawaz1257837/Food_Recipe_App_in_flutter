import 'package:flutter/material.dart';



class Detailed_page extends StatelessWidget {

  String? text1;
  String? image;
  String? text2;
  String? text3;
  String? text4;
  String? ing1;
  String? ing2;
  String? ing3;
  String? ing4;
  String? ing5;
  String? ing6;
  String? ing7;
  String? ing8;
  String? ing9;
  String? ing10;
  String? ing11;
  String? ing12;
  String? ing13;
  String? mea1;
  String? mea2;
  String? mea3;
  String? mea4;
  String? mea5;
  String? mea6;
  String? mea7;
  String? mea8;
  String? mea9;
  String? mea10;
  String? mea11;
  String? mea12;
  String? mea13;


  Detailed_page({this.text1, this.image, this.text2, this.text3, this.text4,
    this.ing1, this.ing2, this.ing3, this.ing4, this.ing5, this.ing6,
    this.ing7, this.ing8, this.ing9, this.ing10, this.ing11, this.ing12,
    this.ing13, this.mea1, this.mea2, this.mea3, this.mea4, this.mea5,
    this.mea6, this.mea7, this.mea8, this.mea9, this.mea10, this.mea11,
    this.mea12, this.mea13});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
                height: 300,
                width: double.infinity,
                child: Image(image: NetworkImage("${image}"),
                  fit: BoxFit.fill,
                )
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("${text1}" , style: TextStyle(color: Colors.black ,fontSize: 20.0 , fontWeight: FontWeight.bold),),
                      // Text("${text4}", style: TextStyle(color: Colors.black ,fontSize: 20.0 , fontWeight: FontWeight.bold),),
                      Text("${text2}", style: TextStyle(color: Colors.black ,fontSize: 20.0 , fontWeight: FontWeight.bold),),

                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${text3}"),
                  ),
                  
                  
                  ExpansionTile(
                    title:  Text("Ingredient" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 20.0),),
                    subtitle: Text("See more details"),
                    children: [

                      ListTile(title: Text("${ing1}") , trailing: Text("${mea1}"),),
                      ListTile(title: Text("${ing2}") , trailing: Text("${mea2}"),),
                      ListTile(title: Text("${ing3}") , trailing: Text("${mea3}"),),
                      ListTile(title: Text("${ing4}") , trailing: Text("${mea4}"),),
                      ListTile(title: Text("${ing5}") , trailing: Text("${mea5}"),),
                      ListTile(title: Text("${ing6}") , trailing: Text("${mea6}"),),
                      ListTile(title: Text("${ing7}") , trailing: Text("${mea7}"),),
                      ListTile(title: Text("${ing8}") , trailing: Text("${mea8}"),),
                      ListTile(title: Text("${ing9}") , trailing: Text("${mea9}"),),
                      ListTile(title: Text("${ing10}") , trailing: Text("${mea10}"),),
                      ListTile(title: Text("${ing11}") , trailing: Text("${mea11}"),),
                      ListTile(title: Text("${ing12}") , trailing: Text("${mea12}"),),
                      ListTile(title: Text("${ing13}") , trailing: Text("${mea13}"),),



                    ],


                  )
                  

                ],
              ),
            )





          ],
        ),
      ),
    );
  }
}

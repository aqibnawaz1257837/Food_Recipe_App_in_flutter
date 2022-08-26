import 'package:flutter/material.dart';



class CocktailDetailedPage extends StatelessWidget {


  String? image1;
  String? text1;
  String? text2;
  String? text3;
  String? text4;
  String? text5;
  String? text6;
  String? text7;
  String? ing1;
  String? ing2;
  String? ing3;
  String? ing4;
  String? ing5;
  String? ing6;
  String? ing7;
  String? mea1;
  String? mea2;
  String? mea3;
  String? mea4;
  String? mea5;
  String? mea6;
  String? mea7;


  CocktailDetailedPage(
      {this.image1,
      this.text1,
      this.text2,
      this.text3,
      this.text4,
      this.text5,
      this.text6,
      this.text7,
      this.ing1,
      this.ing2,
      this.ing3,
      this.ing4,
      this.ing5,
      this.ing6,
      this.ing7,
      this.mea1,
      this.mea2,
      this.mea3,
      this.mea4,
      this.mea5,
      this.mea6,
      this.mea7});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[


          Container(
          height: 300,
          width: double.infinity,
              child:Image(
                image: NetworkImage("${image1}"),
                fit: BoxFit.fill,
            )
          ),


            SizedBox(
              height: 10,
            ),

            Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[


                      Text("${text1}", style: TextStyle(color: Colors.black ,fontSize: 20.0 , fontWeight: FontWeight.bold),),
                      Text("${text2}", style: TextStyle(color: Colors.black ,fontSize: 20.0 , fontWeight: FontWeight.bold),),



                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[


                      Text("${text3}", style: TextStyle(color: Colors.black ,fontSize: 20.0 , fontWeight: FontWeight.bold),),
                      Text("${text4}", style: TextStyle(color: Colors.black ,fontSize: 20.0 , fontWeight: FontWeight.bold),),



                    ],
                  ),
                ),

                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text("${text5}"),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text("${text6}"),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text("${text7}"),
                    ],
                  ),
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
                  ]
                ),



              ],
            )


          ],
        ),
      ),
    );
  }
}


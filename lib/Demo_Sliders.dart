import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mealdbinflutter/Screens/Detailed_page.dart';

import 'Services/Services.dart';



class TestingSliderDemo extends StatefulWidget {

  @override
  State<TestingSliderDemo> createState() => _TestingSliderDemoState();
}

class _TestingSliderDemoState extends State<TestingSliderDemo> {


  List l = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: Services.getamealsResponse(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          if(snapshot.hasError){
            return Text("There is some Error");
          }

          if(snapshot.hasData){

            Map m = snapshot.data;
            l = m['meals'];

            final List<Widget> imageSliders = l
                .map((item) => Container(
                    child: InkWell(


                      onTap: (){

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Detailed_page(
                              text1: "${item['strMeal']}",
                              image: "${item['strMealThumb']}",
                              text2: "${item['strArea']}",
                              text3: "${item['strInstructions']}",
                              text4: "${item['strTags']}",
                              ing1: "${item['strIngredient1']}",
                              ing2: "${item['strIngredient2']}",
                              ing3: "${item['strIngredient3']}",
                              ing4: "${item['strIngredient4']}",
                              ing5: "${item['strIngredient5']}",
                              ing6: "${item['strIngredient6']}",
                              ing7: "${item['strIngredient7']}",
                              ing8: "${item['strIngredient8']}",
                              ing9: "${item['strIngredient9']}",
                              ing10: "${item['strIngredient10']}",
                              ing11: "${item['strIngredient11']}",
                              ing12: "${item['strIngredient12']}",
                              ing13: "${item['strIngredient13']}",
                              mea1: "${item['strMeasure1']}",
                              mea2: "${item['strMeasure2']}",
                              mea3: "${item['strMeasure3']}",
                              mea4: "${item['strMeasure4']}",
                              mea5: "${item['strMeasure5']}",
                              mea6: "${item['strMeasure6']}",
                              mea7: "${item['strMeasure7']}",
                              mea8: "${item['strMeasure8']}",
                              mea9: "${item['strMeasure9']}",
                              mea10: "${item['strMeasure10']}",
                              mea11: "${item['strMeasure11']}",
                              mea12: "${item['strMeasure12']}",
                              mea13: "${item['strMeasure13']}",
                  ),
                  )
              );


                      },

                      child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network("${item["strMealThumb"]}", fit: BoxFit.cover, width: 1000.0),
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
                              child: Text("${item["strMeal"]}",
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
                    ),)).toList();

            return Column(
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: l.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                                  .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ]);
          }


          return Container();
        },

      );
  }
}

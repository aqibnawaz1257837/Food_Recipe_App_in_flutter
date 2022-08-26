import 'package:flutter/material.dart';
import 'package:mealdbinflutter/Widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {

  IconData iconData;
  String text;
  Color iconColors;


  IconAndTextWidget({required this.iconData, required this.text, required this.iconColors});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[


        Icon(iconData , color: iconColors,),
        SizedBox(width: 5,),
        SmallText(text: text),


      ],
    );
  }
}


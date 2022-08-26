import 'package:flutter/material.dart';


class SmallText extends StatelessWidget {


  final Color? cOlor;
  final String text ;
  double size;
  double height;

  SmallText({this.cOlor = const Color(0xFFccc7c5), required this.text, this.size = 12 , this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: cOlor,
        fontFamily: "Roboto",
        fontSize: size,
        height: height,
      ),
    );
  }
}

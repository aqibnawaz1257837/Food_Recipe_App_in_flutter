import 'package:flutter/material.dart';




class BigText extends StatelessWidget {


  final Color? cOlor;
  final String text ;
  double size;
  final TextOverflow textOverflow;


  BigText({this.cOlor = const Color(0xFF89dad0), required this.text, this.size = 0, this.textOverflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        color: cOlor,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
        fontSize: size == 0 ? 20 : size,
      ),
    );
  }
}

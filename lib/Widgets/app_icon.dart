import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {

  final IconData iconData;
  final Color backgroundcolor;
  final Color iconColors;
  final double size;


  AppIcon({required this.iconData, this.backgroundcolor =const Color(0xfffcf4e4), this.iconColors =const Color(0xff756d54), this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(size/2),
      ),
      child: Icon(
        iconData,
        size: 16,
      ),
    );
  }
}

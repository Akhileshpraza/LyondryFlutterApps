import 'package:flutter/material.dart';

class Limages{
  //one way
  //static Icon addIcon = Icon(Icons.add);
  //second way
  //String addIcons = "assets/images/logo_icon";
  String bigLogo = "assets/images/logo_big.png";
  static Image  biglogo =Image.asset('assets/images/logo_big.png', fit:BoxFit.fill);
  static Image  smalllogo =Image.asset('assets/images/logo_small.png', height: 150,);
}
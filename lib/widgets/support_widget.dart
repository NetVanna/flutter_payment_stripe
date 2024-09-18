import 'package:flutter/material.dart';

class SupportWidget{
  static TextStyle boldTextFieldStyle(){
    return const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
  static TextStyle lightTextFieldStyle(){
    return const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.black54,
        fontSize: 18
    );
  }
  static TextStyle simiBoldTextFieldStyle(){
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}
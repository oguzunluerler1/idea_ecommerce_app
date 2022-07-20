import 'package:flutter/material.dart';

class RouteHelper {
  static void goRoute({required BuildContext context,required Widget page}){
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/home_screen.dart';
import 'package:movie_app/Screens/see_more_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: HomeScreen(),
    );
  }
}


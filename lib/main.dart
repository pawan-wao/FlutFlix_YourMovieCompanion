import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/home_screen.dart';
import 'package:movie_app/see_more_screen.dart';
import 'package:movie_app/carousel_slider.dart';

import 'now_playing_Screen.dart';

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
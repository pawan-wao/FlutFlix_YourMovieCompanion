import 'package:flutter/material.dart';
import 'api.dart';
import 'package:movie_app/carousel_slider.dart';
import 'package:movie_app/now_playing_Screen.dart';
import 'home_screen.dart';

class MovieDetail extends StatelessWidget{

  String title;
  String desc;
  String poster;
  String releaseDate;
  String vote;

  MovieDetail({required this.title,
    required this.desc,
    required this.poster,
    required this.releaseDate,
    required this.vote,
  });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 300,
                  width: 150,
                  child: Image.asset("${Api.poster_baseuri}${poster}", fit: BoxFit.cover,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*
{
            "adult": false,
            "backdrop_path": "/sp6egj5NHHRGmCMdIoTNdbLwACR.jpg",
            "id": 1022964,
            "title": "Candy Cane Lane",
            "original_language": "en",
            "original_title": "Candy Cane Lane",
            "overview": "A man, determined to win the neighborhood's annual Christmas decorating contest, makes a pact with an elf to help him win. However, the elf casts a spell bringing the twelve days of Christmas to life, bringing chaos to the small, unsuspecting town.",
            "poster_path": "/qQLC8iFicw1vVVbGMyyZzeghC4w.jpg",
            "media_type": "movie",
            "genre_ids": [
                35,
                14,
                10751
            ],
            "popularity": 98.281,
            "release_date": "2023-11-29",
            "video": false,
            "vote_average": 6.712,
            "vote_count": 26
        },
 */
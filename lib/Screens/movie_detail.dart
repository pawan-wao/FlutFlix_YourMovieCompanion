import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/API/api.dart';
import 'package:movie_app/Screens/movie_list.dart';
import 'home_screen.dart';
import 'package:read_more_text/read_more_text.dart';

class MovieDetail extends StatelessWidget{

  String title;
  String desc;
  String poster;
  var releaseDate;
  var vote;

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
        backgroundColor: Color(0xFF1B1A1D),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //back and bookmark icon
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 50,),
                child: Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_rounded, color: Color(0xFFFD3920),)),
                    Spacer(),
                    Icon(CupertinoIcons.bookmark, color: Colors.grey,),
                  ],
                ),
              ),
              SizedBox(height: 30,),

              // main image
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.4,
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Image.network("${Api.poster_baseuri}${poster}", fit: BoxFit.fill,),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // rating
                        Container(
                          height: 95,
                          width: 100,
                          decoration: BoxDecoration(color:Color(0xFF262428),
                              borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25), bottomRight: Radius.circular(25),
                         )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.star,color: Color(0xFFFD3920,),size: 25),
                              SizedBox(height: 6,),
                              Text("${vote.toString().substring(0,3)}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),),
                              SizedBox(height: 4,),
                              Text("Rating",style: TextStyle(fontSize: 17,color: Colors.grey),),
                              SizedBox(height: 4,),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

                        // Duration
                        Container(
                          height: 95,
                          width: 100,
                          decoration: BoxDecoration(color:Color(0xFF262428),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25), bottomRight: Radius.circular(25),
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.clock_fill,color: Color(0xFFFD3920,),size: 25),
                              SizedBox(height: 6,),
                              Text('2h 10m',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),),
                              SizedBox(height: 4,),
                              Text("Duration",style: TextStyle(fontSize: 17,color: Colors.grey),),
                              SizedBox(height: 4,),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),

                        // year
                        Container(
                          height: 95,
                          width: 100,
                          decoration: BoxDecoration(color:Color(0xFF262428),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25), bottomRight: Radius.circular(25),
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month,color: Color(0xFFFD3920,),size: 25),
                              SizedBox(height: 6,),
                              Text('${releaseDate.toString().substring(0,4)}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),),
                              SizedBox(height: 4,),
                              Text("Year",style: TextStyle(fontSize: 15,color: Colors.grey),),
                              SizedBox(height: 4,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),

              //movie description
              //tittle - plot overview
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Plot Overview",style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                child: ReadMoreText(desc.toString(),
                    numLines: 4,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                    readMoreText:'Read More',
                    readLessText: 'Show less',),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Similiar",style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 9),
                child: MovieList(endp: 'https://api.themoviedb.org/3/trending/movie/day?api_key=',),
              ),
            ],
          ),
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
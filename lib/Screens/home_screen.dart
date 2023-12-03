import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/see_more_screen.dart';
import 'package:movie_app/Screens/carousel_slider.dart';
import 'movie_list.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF262428),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu_rounded,color: Color(0xFFFD3920)),
                    Image.asset('assets/images/flutflix.png', height: 40, fit: BoxFit.cover, ),
                    Icon(Icons.search_rounded,color: Color(0xFFFD3920)),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              //trendin movies
              CarouselSliderScreen(),
              SizedBox(height: 25,),

              //Recommended
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: [
                    Text("Upcoming Movies",style: TextStyle(color: Colors.white,
                      fontSize: 16, fontWeight: FontWeight.bold,
                    ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(
                            builder: (context) => SeeMore(title: 'Upcoming', apiEndpoint: "https://api.themoviedb.org/3/movie/upcoming?api_key="),));
                        },
                        child: Icon(Icons.arrow_forward_ios,
                            size: 17,color: Color(0xFFFD3920)   )),
                  ],
                ),
              ),
              SizedBox(height: 17,),
              MovieList(endp: "https://api.themoviedb.org/3/movie/upcoming?api_key="),
              SizedBox(height: 15,),

              //Now Playing
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: [
                    Text("Now Playing",style: TextStyle(color: Colors.white,
                      fontSize: 16, fontWeight: FontWeight.bold,
                    ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(
                            builder: (context) => SeeMore(title: 'Now Playing', apiEndpoint: "https://api.themoviedb.org/3/movie/now_playing?api_key="),));
                        },
                        child: Icon(Icons.arrow_forward_ios,size: 15,color: Color(0xFFFD3920),)),
                  ],
                ),
              ),
              SizedBox(height: 17,),
              MovieList(endp: "https://api.themoviedb.org/3/movie/now_playing?api_key="),
              SizedBox(height: 15,),

              // Top Rated
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: [
                    Text("Top Rated",style: TextStyle(color: Colors.white,
                      fontSize: 16, fontWeight: FontWeight.bold,
                    ),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(
                            builder: (context) => SeeMore(title: 'Top Rated Movies', apiEndpoint: "https://api.themoviedb.org/3/movie/top_rated?api_key="),));
                        },
                        child: Icon(Icons.arrow_forward_ios,size: 15,color: Color(0xFFFD3920),)),
                  ],
                ),
              ),
              SizedBox(height: 17,),
              MovieList(endp: "https://api.themoviedb.org/3/movie/top_rated?api_key="),
              SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
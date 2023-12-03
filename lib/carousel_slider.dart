import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/see_more_screen.dart';
import 'ModelData.dart';
import 'package:movie_app/api.dart';
import 'main.dart';
import 'package:carousel_slider/carousel_options.dart';

class CarouselSliderScreen extends StatefulWidget{
  @override
  State<CarouselSliderScreen> createState() => _CarouselSliderScreenState();
}

class _CarouselSliderScreenState extends State<CarouselSliderScreen> {

 late Future<List<Movie>> trendingMovies;

  @override
  void initState() {
    trendingMovies = Api(endpoint:'https://api.themoviedb.org/3/trending/movie/day?api_key=').getTrendingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: trendingMovies,
          builder: (context, snapshot){
            if (snapshot.hasData ) {
              return CarouselSlider.builder(
                  itemCount: 20,
                options: CarouselOptions(
                  height: 270,
                  autoPlay: true,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.55,
                ),
                  itemBuilder: (BuildContext, index, realindex){
                    return
                      snapshot.data![index] !=null ?
                      Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                        child: Material(
                          elevation: 1.5,
                            child: Image.network("${Api.poster_baseuri}${snapshot.data![index].poster}",fit: BoxFit.cover,))),
                  ):CircularProgressIndicator();
                  },
                );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Screens/movie_detail.dart';
import 'package:movie_app/Screens/see_more_screen.dart';
import 'package:movie_app/API/api.dart';
import 'package:movie_app/API/api.dart';
import '../API/ModelData.dart';

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
                  viewportFraction: 0.45,
                ),
                  itemBuilder: (BuildContext, index, realindex){
                    Movie movie = snapshot.data![index];
                    return
                      snapshot.data![index] !=null ?
                      Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                        child: Material(
                          elevation: 1.5,
                            child: InkWell(
                                onTap: (){
                                  //null checks
                                  movie.title != null &&
                                      movie.desc != null &&
                                      movie.poster != null &&
                                      movie.releaseDate != null &&
                                      movie.vote !=null ?
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetail(
                                    title: movie.title, desc: movie.desc, poster: movie.poster, releaseDate: movie.releaseDate,
                                    vote: movie.vote,
                                  ),
                                  )
                                  ): Text("No data available");

                                },
                                child: Container(
                                    child: Image.network("${Api.poster_baseuri}${snapshot.data![index].poster}",fit: BoxFit.cover,))))),
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
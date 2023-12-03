import 'dart:convert';

import 'package:movie_app/API/ModelData.dart';
import 'package:http/http.dart' as http;

class Api {
   String? endpoint;
   static const api_key = "d8535a660630f6c9ebce2a08af978b22";
   //static const trendingurl ="${endpoint}${api_key}";
   // trendin movies end point -->'https://api.themoviedb.org/3/trending/movie/day?api_key='
  static const poster_baseuri = "https://image.tmdb.org/t/p/original";

  Future<List<Movie>> getTrendingList() async{
    var response = await http.get(Uri.parse("${endpoint}${api_key}"));
    if (response.statusCode==200) {
      var data = jsonDecode(response.body)['results'] as List;
      return data.map((movie) => Movie.fromJson(movie)).toList();
    }  else{
      throw Exception('Somthing happened');
    }
  }

  Api({this.endpoint});
}

import 'package:movie_app/Screens/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/API/api.dart';
import 'package:movie_app/API/ModelData.dart';

class MovieList extends StatefulWidget{
  final String? endp;
  MovieList({ this.endp});
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late Future<List<Movie>> nowPlayingMovie;

  @override
  void initState() {
    super.initState();
    nowPlayingMovie = Api(endpoint: "${widget.endp}").getTrendingList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: FutureBuilder(
        future: nowPlayingMovie,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error occurred: ${snapshot.error}'),
            );
          } else if (snapshot.hasData
          ) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Movie movie = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 190,
                        width: 130,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          child: movie.poster != null
                              ? InkWell(
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
                                child: Image.network(
                            '${Api.poster_baseuri}${movie.poster}',
                            fit: BoxFit.cover,
                          ),
                              )
                              : Container(
                            color: Colors.grey,
                            // Placeholder if no image
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 130,// Width same as the image
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie.title ?? 'Title not available',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}

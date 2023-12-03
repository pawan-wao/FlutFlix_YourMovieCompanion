import 'package:movie_app/movie_detail.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api.dart';
import 'package:movie_app/ModelData.dart';

class NowPlaying extends StatefulWidget{
  final String? endp;
  NowPlaying({ this.endp});
  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
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
              child: Text('Error fetching data'),
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
                      InkWell(
                       /* onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetail(
                              title: movie.title, desc: movie.desc, poster: movie.poster, releaseDate: movie.releaseDate,
                            vote: movie.vote,
                          ),));
                        },*/
                        child: Container(

                          height: 190,
                          width: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            child: movie.poster != null
                                ? Image.network(
                              '${Api.poster_baseuri}${movie.poster}',
                              fit: BoxFit.cover,
                            )
                                : Container(
                              color: Colors.grey,
                              // Placeholder if no image
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 170,// Width same as the image
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

import 'package:flutter/material.dart';
import 'package:movie_app/Screens/movie_detail.dart';
import 'package:movie_app/API/api.dart';
import 'package:movie_app/API/ModelData.dart';

class SeeMore extends StatefulWidget {
  String title;
  String apiEndpoint;

  SeeMore({required this.title, required this.apiEndpoint});
  @override
  State<SeeMore> createState() => _SeeMoreState();
}
class _SeeMoreState extends State<SeeMore> {
  late Future<List<Movie>> seeMore;

  @override
  void initState() {
    super.initState();
    seeMore = Api(
      endpoint: "${widget.apiEndpoint}",
    ).getTrendingList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      appBar: AppBar(
        title: Text('${widget.title}'),
        backgroundColor: Color(0xFF333333),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_rounded,color: Color(0xFFFD3920))),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: seeMore,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No Data Available'));
          } else {

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 15,
                mainAxisExtent: 290,
                childAspectRatio: (MediaQuery.of(context).size.width)/
                  MediaQuery.of(context).size.width/4,

              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Movie movie = snapshot.data![index];

                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(// Increased image width by 20
                        height: 230,
                        width: 190,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          child: Container(
                            color: Colors.black,
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
                                child: Image.network(
                                  "${Api.poster_baseuri}${snapshot.data![index].poster}",
                                  fit: BoxFit.cover, filterQuality: FilterQuality.medium
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          snapshot.data![index].title ?? 'Title not available',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

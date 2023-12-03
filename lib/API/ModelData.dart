class Movie{
  String title;
  String desc;
  String poster;
  var releaseDate;
  var vote;

  Movie({
    this.title='tittle here',
    this.desc='description here',
    required this.poster,
    required this.vote,
   required this.releaseDate,
  });

  factory Movie.fromJson(Map<String,dynamic>json){
    return Movie(
        title: json["title"],
        poster: json["poster_path"],
      desc: json["overview"],
        vote: json["vote_average"],
    releaseDate: json["release_date"]
    );
  }

}




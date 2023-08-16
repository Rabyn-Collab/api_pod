


class Movie {
  final String backdrop_path;
  final int id;
  final String overview;
  final String poster_path;
  final String release_date;
  final String title;
  final String vote_average;

  Movie({
    required this.id,
    required this.title,
    required this.backdrop_path,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.vote_average
});


  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
        id: json['id'],
        title: json['title'] ?? '',
        backdrop_path: json['backdrop_path'] ?? '',
        overview: json['overview'] ?? '',
        poster_path: json['poster_path'] ?? '',
        release_date: json['release_date'] ?? '',
        vote_average: json['vote_average'].toString()
    );
  }


  @override
  String toString() {

    return  'Movie('
           'id : ${this.id}'
           'title : ${this.title}'
           'backdrop_path: ${this.backdrop_path} '
            'overview: ${this.overview}'
            'poster_path: ${this.poster_path}'
           'release_date: ${this.release_date}'
           'vote_average: ${this.vote_average}'
           ')';
  }

}

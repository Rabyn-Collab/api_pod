import 'package:movie/models/movie.dart';



class MovieState{

  final bool isLoad;
  final bool isSuccess;
  final bool isError;
  final String errText;
  final List<Movie> movies;
  final int page;
  final String apiPath;



  MovieState({
    required this.errText,
    required this.isError,
    required this.isLoad,
    required this.isSuccess,
    required this.movies,
    required this.page,
    required this.apiPath
});



  MovieState copyWith({
    bool? isLoad,
    bool? isSuccess,
    bool? isError,
    String? errText,
    List<Movie>? movies,
    int? page,
    String? apiPath
}){
    return MovieState(
    errText: errText ?? this.errText,
    isError: isError ?? this.isError,
   isLoad: isLoad ?? this.isLoad,
        isSuccess: isSuccess ?? this.isSuccess,
   movies: movies ?? this.movies,
   page: page ?? this.page,
      apiPath: apiPath ?? this.apiPath
);
  }

}
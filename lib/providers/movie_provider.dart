import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/models/movie.dart';



final movieProvider = StateNotifierProvider<MovieProvider, List<Movie>>((ref) => MovieProvider([]));


class MovieProvider extends StateNotifier<List<Movie>>{

  MovieProvider(super.state){
    getMovieCategory();
  }

  final dio = Dio();


  Future<void> getMovieCategory () async{
    try{
      final response = await dio.get('https://api.themoviedb.org/3/movie/popular',
          options: Options(
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYTBmOTI2OTYxZDAwYzY2N2UxOTFhMjFjMTQ0NjFmOCIsInN1YiI6IjYwNDYxNTM0MzVhNjFlMDA1YjdjMmZmYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LvbdGQ5pvkEgSZY4JkNVIY3g-qF8PRygp7FnacsO1R0'
        }
      ));
      state = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
    }catch (err){
      state = [];
    }
  }



}
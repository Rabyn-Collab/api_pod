import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/api.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/models/movie_state.dart';



final movieProvider = StateNotifierProvider<MovieProvider, MovieState>((ref) => MovieProvider(
        MovieState(
      errText: '',
      isError: false,
      isLoad: false,
      isSuccess: false,
      movies: [],
      page: 1,
          apiPath: Api.getPopular
  )
));


class MovieProvider extends StateNotifier<MovieState>{

  MovieProvider(super.state){
    getMovieCategory();
  }

  final dio = Dio();


  Future<void> getMovieCategory () async{
    state = state.copyWith(isLoad: true, isSuccess: false, isError: false, errText: '');
    try{
      final response = await dio.get(state.apiPath,
          queryParameters: {
          'page': state.page
          },
          options: Options(
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYTBmOTI2OTYxZDAwYzY2N2UxOTFhMjFjMTQ0NjFmOCIsInN1YiI6IjYwNDYxNTM0MzVhNjFlMDA1YjdjMmZmYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LvbdGQ5pvkEgSZY4JkNVIY3g-qF8PRygp7FnacsO1R0'
        }
      ));
      final data  = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      state = state.copyWith(isLoad: false, isSuccess: true, isError: false, errText: '', movies: data);
    }on DioException catch (e) {
      print(e);
      state = state.copyWith(isLoad: false, isSuccess: false, isError: true, errText: e.message, );
    }
  }



}
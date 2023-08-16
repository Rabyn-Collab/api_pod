import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/providers/movie_provider.dart';


class TabBarWidgets extends StatelessWidget {
  const TabBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          final movieData = ref.watch(movieProvider);
          if(movieData.isLoad){
            return Center(child: CircularProgressIndicator());
          }else if(movieData.isError){
            return Center(child: Text(movieData.errText));
          }else{
            return GridView.builder(
              itemCount: movieData.movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                ),
                itemBuilder: (context, index){
                final movie = movieData.movies[index];
                return Text(movie.title);
                }
            );
          }
        }
    );
  }
}

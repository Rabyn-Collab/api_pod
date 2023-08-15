import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/providers/movie_provider.dart';






class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
            builder: (context, ref, child) {
              final movieData = ref.watch(movieProvider);
              print(movieData);
              return const Placeholder();
            }
    )
    );
  }
}

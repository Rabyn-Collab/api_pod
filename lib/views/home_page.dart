import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:movie/views/widgets/tab_widget.dart';






class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movie Tmdb'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search))
          ],
          toolbarHeight: 90,
          bottom: TabBar(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              indicatorPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              indicator: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10)
              ),
              tabs: [
            Tab(text: 'Popular'),
            Tab(text: 'Top Rated'),
            Tab(text: 'Upcoming'),
          ]),

        ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
              children: [
           TabBarWidgets(),
            Text('topRated'),
            Text('upComing'),
          ])
      ),
    );
  }
}

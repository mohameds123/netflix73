import 'package:flutter/material.dart';
import 'package:netflix73/presentation/widgets/now_playing_movies_widget.dart';
import '../widgets/popular_movies_widget.dart';
import '../widgets/top_rated_movies_widget.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          NowPlayingMoviesWidget(),
          PopularMoviesWidget(),
          TopRatedMoviesWidget(),
        ],
      ),
    );
  }
}

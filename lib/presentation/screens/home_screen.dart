import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix73/logic/now_playing_cubit/now_playing_cubit.dart';
import 'package:netflix73/logic/popular_cubit/popular_cubit.dart';
import 'package:netflix73/logic/top_rated_cubit/top_rated_cubit.dart';
import 'package:netflix73/presentation/widgets/now_playing_movies_widget.dart';
import '../widgets/popular_movies_widget.dart';
import '../widgets/top_rated_movies_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NowPlayingCubit()..getNowPlayingMovies(),),
        BlocProvider(create: (context) => PopularCubit()..getPopularMovies(),),
        BlocProvider(create: (context) => TopRatedCubit()..getTopRatedMovies(),),

      ],

      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            NowPlayingMoviesWidget(),
            PopularMoviesWidget(),
            TopRatedMoviesWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix73/logic/top_rated_cubit/top_rated_cubit.dart';
import 'package:netflix73/logic/top_rated_cubit/top_rated_state.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  const TopRatedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        if (state is TopRatedLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if (state is TopRatedSuccessState) {
          final x = state.movieModel.results;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Top Rated",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 161,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: x.length,
                      itemBuilder: (context, index) {
                        final topRated = x[index];
                        return Image.network("https://image.tmdb.org/t/p/w500${topRated.posterPath}");
                      }
                  ),
                )

              ],
            ),
          );
        } else if (state is TopRatedErrorState){
          return Text(state.em);
        } else {
          return SizedBox();
        }
      },
    );
  }
}

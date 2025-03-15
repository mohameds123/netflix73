import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix73/logic/popular_cubit/popular_cubit.dart';
import 'package:netflix73/logic/popular_cubit/popular_state.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(

      builder: (context, state) {
        if (state is PopularLoadingState){
          return Center(child: CircularProgressIndicator(),);

        }else if (state is PopularSuccessState){
          final x = state.movieModel.results;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Popular on netflix",
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
                        final popularMovie = x[index];
                        return Image.network("https://image.tmdb.org/t/p/w500${popularMovie.posterPath}");
                      }
                  ),
                )

              ],
            ),
          );
        } else if (state is PopularErrorState){
          return Text(state.em);
        }else {
          return SizedBox();
        }
      },
    );
  }
}

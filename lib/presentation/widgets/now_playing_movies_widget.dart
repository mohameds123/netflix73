import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix73/logic/now_playing_cubit/now_playing_cubit.dart';
import 'package:netflix73/logic/now_playing_cubit/now_playing_state.dart';

class NowPlayingMoviesWidget extends StatelessWidget {
  const NowPlayingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingStates>(

      builder: (context, state) {
        if(state is NowPlayingLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if (state is NowPlayingSuccessState){
          final x = state.moviesModel.results;
          return SizedBox(
            height: 370,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: x.length,
              itemBuilder: (context, index){
                final movies = x[index];

                return Stack(
                  children: [
                    Image.network("https://image.tmdb.org/t/p/w500${movies.posterPath}"),
                    Padding(
                      padding: const EdgeInsets.only(top: 300, left: 90),
                      child: Row(
                        children: [
                          Container(
                            width: 15, height: 15,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100)
                            ),
                          ),
                          SizedBox(width: 8,),
                          Text("NOW PLAYING",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w300,
                                color: Colors.white
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );

        }else if (state is NowPlayingErrorState){
          return Center(child: Text(state.em));
        }else {
          return SizedBox();
        }
      },
    );
  }
}

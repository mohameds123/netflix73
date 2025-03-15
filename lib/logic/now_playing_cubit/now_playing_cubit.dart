import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:netflix73/data/movie_model.dart';

import 'now_playing_state.dart';


class NowPlayingCubit extends Cubit<NowPlayingStates> {
  NowPlayingCubit() : super(NowPlayingInitialState());
  //
Dio dio = Dio();
Future getNowPlayingMovies ()async {
  emit(NowPlayingLoadingState());
  try{
    //
    final response = await dio.get("https://api.themoviedb.org/3/movie/now_playing?api_key=87903828b97a85b50c60fb3bbd960c55");
    //
    if (response.statusCode == 200){
      final nowPlayingJsonToDart = MovieModel.fromJson(response.data);
      emit(NowPlayingSuccessState(nowPlayingJsonToDart));
    }
  }catch (e){
    emit(NowPlayingErrorState(e.toString()));
  }
}
}

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:netflix73/data/movie_model.dart';
import 'package:netflix73/logic/top_rated_cubit/top_rated_state.dart';


class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit() : super(TopRatedInitialState());

  Dio dio = Dio();

  Future getTopRatedMovies ()async {
    emit(TopRatedLoadingState());
    try{
      final res = await dio.get("https://api.themoviedb.org/3/movie/top_rated?api_key=87903828b97a85b50c60fb3bbd960c55");
      if (res.statusCode == 200){
        final topRatedJsonToDart =  MovieModel.fromJson(res.data);
        emit(TopRatedSuccessState(topRatedJsonToDart));
      }

    }catch (e){
      emit(TopRatedErrorState(e.toString()));
    }
  }
}

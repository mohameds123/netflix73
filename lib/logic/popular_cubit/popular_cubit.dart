import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:netflix73/data/movie_model.dart';
import 'package:netflix73/logic/popular_cubit/popular_state.dart';


class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitialState());

  Dio dio = Dio();

  Future getPopularMovies ()async {
    emit(PopularLoadingState());
    try{
      final res = await dio.get("https://api.themoviedb.org/3/movie/popular?api_key=87903828b97a85b50c60fb3bbd960c55");
      if (res.statusCode == 200){
       final popularJsonToDart =  MovieModel.fromJson(res.data);
        emit(PopularSuccessState(popularJsonToDart));
      }

    }catch (e){
      emit(PopularErrorState(e.toString()));
    }
  }
}

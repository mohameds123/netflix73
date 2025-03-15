import 'package:netflix73/data/movie_model.dart';

class PopularState {}

class PopularInitialState extends PopularState{}

class PopularLoadingState extends PopularState{}

class PopularSuccessState extends PopularState{
  final MovieModel movieModel;
  PopularSuccessState (this.movieModel);
}

class PopularErrorState extends PopularState{
  final String em;
  PopularErrorState (this.em);
}

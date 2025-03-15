import 'package:netflix73/data/movie_model.dart';

class TopRatedState {}

class TopRatedInitialState extends TopRatedState{}

class TopRatedLoadingState extends TopRatedState{}

class TopRatedSuccessState extends TopRatedState{
  final MovieModel movieModel;
  TopRatedSuccessState (this.movieModel);
}

class TopRatedErrorState extends TopRatedState{
  final String em;
  TopRatedErrorState (this.em);
}

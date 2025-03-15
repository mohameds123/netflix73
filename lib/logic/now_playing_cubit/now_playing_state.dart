import 'package:netflix73/data/movie_model.dart';

class NowPlayingStates{}

class NowPlayingInitialState extends NowPlayingStates{}

class NowPlayingLoadingState extends NowPlayingStates{}

class NowPlayingSuccessState extends NowPlayingStates{
final MovieModel moviesModel;
NowPlayingSuccessState(this.moviesModel);
}

class NowPlayingErrorState extends NowPlayingStates{
  final String em;
  NowPlayingErrorState (this.em);
}

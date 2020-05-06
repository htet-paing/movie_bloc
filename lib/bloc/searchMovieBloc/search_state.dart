part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchMovieInitialState extends SearchState {
  @override
  List<Object> get props => [];
}
class SearchMovieLoadingState extends SearchState{
  @override
  List<Object> get props => [];
}

class SearchMovieLoadedState extends SearchState{
  final List<Results> movies;
  SearchMovieLoadedState({this.movies});

  @override
  List<Object> get props => throw UnimplementedError();
}

class SearchMovieErrorState extends SearchState{
  final String message;
  SearchMovieErrorState({this.message});

  @override
  List<Object> get props => throw UnimplementedError();
}

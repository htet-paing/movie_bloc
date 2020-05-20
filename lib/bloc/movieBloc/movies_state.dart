import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc/data/model/api_result_model.dart';

abstract class MoviesState extends Equatable {}

class MoviesInitialState extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoadingState extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoadedState extends MoviesState {
  final List<Results> movies;
  MoviesLoadedState({@required this.movies});
  get g => movies;
  @override
  List<Object> get props => null;
}

class MoviesErrorState extends MoviesState {
  final String message;
  MoviesErrorState({@required this.message});
  @override
  List<Object> get props => null;
}


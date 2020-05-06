import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_bloc/bloc/movieBloc/movies_event.dart';
import 'package:movie_bloc/bloc/movieBloc/movies_state.dart';
import 'package:movie_bloc/data/model/api_result_model.dart';
import 'package:movie_bloc/data/reposities/movie_rsposities.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MovieReposity reposity;
  MoviesBloc({@required this.reposity});

  

  @override
  MoviesState get initialState => MoviesInitialState();

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event,) async* {
    if (event is FetchMoviesEvent){
      yield MoviesLoadingState();
      try{
        List<Results> movies = await reposity.getMovies(event.movieType);
        yield MoviesLoadedState(movies: movies);
      }catch (e){
        yield MoviesErrorState(message: e.toString());
      }
    }
  }
}

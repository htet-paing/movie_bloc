import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_bloc/data/model/api_result_model.dart';
import 'package:movie_bloc/data/reposities/movie_rsposities.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  MovieReposity reposity;
  SearchBloc({@required this.reposity});    
  @override
  SearchState get initialState => SearchMovieInitialState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if(event is FetchMovieBySearchEvent){
      yield SearchMovieLoadingState();
      try{
        List<Results> movies = await reposity.getMoviesBySearch(event.query);
        yield SearchMovieLoadedState(movies: movies);
      }catch (e){
        yield SearchMovieErrorState(message: e.toString());
      }
    }
  }
}

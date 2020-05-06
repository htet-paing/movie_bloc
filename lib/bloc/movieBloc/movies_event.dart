import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
abstract class MoviesEvent extends Equatable {}

class FetchMoviesEvent extends MoviesEvent{

final String movieType;
FetchMoviesEvent({@required this.movieType});

  @override
  List<Object> get props => [movieType];



}

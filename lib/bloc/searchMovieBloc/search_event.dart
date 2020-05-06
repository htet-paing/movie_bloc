part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class FetchMovieBySearchEvent extends SearchEvent{
  final String query;
  FetchMovieBySearchEvent({this.query});
  
  @override
  List<Object> get props => [query];

}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/searchMovieBloc/search_bloc.dart';
import 'package:movie_bloc/widget/movie_overview_item.dart';
import 'package:movie_bloc/widget/network_error.dart';
import 'package:movie_bloc/widget/searchMovieBox.dart';

class SearchScreen extends StatelessWidget {
    static const routeName = '/searchScreen';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: InkWell(
          splashColor: Colors.transparent,
          onTap: (){
            
          },
          child: Column(
            children: <Widget>[
              SearchMovieBox(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state){
                      if(state is SearchMovieInitialState){
                        return Container();
                      }else if (state is SearchMovieLoadingState){
                        return Center(child: CircularProgressIndicator(),);
                      }else if (state is SearchMovieLoadedState){
                        if (state.movies.length == 0){
                          return Center(
                            child: Text('Nothing Found !', style: TextStyle(
                               color: Color(0xFFdddddd),
                               fontSize: 18,
                               fontFamily: "Poppins-Regular"
                            ),),
                          );
                        }
                        return MovieOverViewItem(state.movies);
                      }else if(state is SearchMovieErrorState){
                        return NetworkError();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
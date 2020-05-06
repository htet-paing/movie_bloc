import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/auth/authenticationBloc/authentication_bloc.dart';
import 'package:movie_bloc/bloc/movieBloc/movies_bloc.dart';
import 'package:movie_bloc/bloc/movieBloc/movies_event.dart';
import 'package:movie_bloc/bloc/movieBloc/movies_state.dart';
import 'package:movie_bloc/screen/search_screen.dart';
import 'package:movie_bloc/widget/movie_overview_item.dart';
import 'package:movie_bloc/widget/movies_loading.dart';
import 'package:movie_bloc/widget/network_error.dart';

import 'movies_tab_screen.dart';

class MovieOverviewScreen extends StatefulWidget {

  @override
  _MovieOverviewScreenState createState() => _MovieOverviewScreenState();
}

class _MovieOverviewScreenState extends State<MovieOverviewScreen> {
  MoviesBloc movieBloc;
  @override
  void initState() {
    movieBloc = BlocProvider.of<MoviesBloc>(context);
    movieBloc.add(FetchMoviesEvent(movieType: 'now_playing'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Movies',style: TextStyle(
          fontFamily: "Poppins-Bold",
          fontSize: width * 0.07,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600)),
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: (){
              Navigator.of(context).pushNamed(
                SearchScreen.routeName
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: (){
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],
      ),
        
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MoviesTabScreen(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child:  BlocBuilder<MoviesBloc, MoviesState>(        
                builder: (context, state){
            if (state is MoviesInitialState){
              return MoviesLoading();
            }else if (state is MoviesLoadingState){
              return MoviesLoading();
            }else if (state is MoviesLoadedState){
              return MovieOverViewItem(state.movies);
            }else if (state is MoviesErrorState){
              return NetworkError();
            }  
            return Container();       
          },
           ),
              )
            ],
          ),
        ),
      ), 
    );
  }
}


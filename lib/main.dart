import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/movieBloc/movies_bloc.dart';
import 'package:movie_bloc/bloc/searchMovieBloc/search_bloc.dart';
import 'package:movie_bloc/data/reposities/movie_rsposities.dart';
import 'package:movie_bloc/screen/movie_detail_screen.dart';
import 'package:movie_bloc/screen/search_screen.dart';
import './screen/movie_overview_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<MoviesBloc>(
          create: (context) => MoviesBloc(reposity: MovieRepositoryImpl()),),
        
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(reposity: MovieRepositoryImpl()),
        ),
        
      ] , 
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red,  
      ),
      // home:  MovieOverviewScreen(),
      initialRoute: '/',
      routes: {
        '/' : (ctx) => MovieOverviewScreen(),
        MovieDetailScreen.routeName : (ctx) => MovieDetailScreen(),
        SearchScreen.routeName : (ctx) => SearchScreen(),
      },
      ),
    );
  }
}


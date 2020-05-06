import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc/data/model/api_result_model.dart';
class MoviesCarousel extends StatelessWidget {
  final List<Results> movies;
  MoviesCarousel(this.movies);
  @override
  Widget build(BuildContext context) {
    
    return Container(
            margin: EdgeInsets.all(10),
            height: 160,
            width: MediaQuery.of(context).size.width,
            child: Carousel(
            boxFit: BoxFit.cover,
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 4,       
            dotIncreasedColor: Colors.black,
            dotBgColor: Colors.transparent,
            dotPosition: DotPosition.bottomCenter,
            // borderRadius: true,
            dotVerticalPadding: 10.0,
            showIndicator: true,
            indicatorBgPadding: 7,
            images: movies.map((movie) => 
            NetworkImage('https://image.tmdb.org/t/p/w500$movies.backdropPath')
              ).toList()           
            ),
          );
  }
}
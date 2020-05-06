import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/movieBloc/movies_bloc.dart';
import 'package:movie_bloc/bloc/movieBloc/movies_event.dart';
class MoviesTabScreen extends StatefulWidget {
  @override
  _MoviesTabScreenState createState() => _MoviesTabScreenState();
}

class _MoviesTabScreenState extends State<MoviesTabScreen> {
   int activeIndex = 0;
   MoviesBloc movieBloc;
  @override
  Widget build(BuildContext context) {
    movieBloc = BlocProvider.of<MoviesBloc>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[        
          tab(0, "In Threaters", "now_playing"),
          tab(1, "Upcomings", "upcoming"),
          tab(2, "Popular", "popular"),
        ],
      ),
    );
  }

  Widget tab(int index, String title, String movieType) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16),
      child: InkWell(
        onTap: () {
          movieBloc.add(FetchMoviesEvent(movieType: movieType));
          setState(() {
            activeIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  activeIndex == index ? Colors.redAccent : Color(0xFF333333)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins-Light",
                color: activeIndex == index ? Colors.white : Color(0xFF999999),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

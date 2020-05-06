import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/bloc/searchMovieBloc/search_bloc.dart';
class SearchMovieBox extends StatefulWidget {
  @override
  _SearchMovieBoxState createState() => _SearchMovieBoxState();
}

class _SearchMovieBoxState extends State<SearchMovieBox> {
  TextEditingController textEditingController;
  SearchBloc searchBloc;
    FocusNode focusNode;

  
  @override
  void initState() {
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF222222),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: TextFormField(
                    controller: textEditingController,
                    autofocus: true,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value) {
                      setState(() {
                        searchBloc = BlocProvider.of(context);
                        searchBloc.add(FetchMovieBySearchEvent(query: textEditingController.text));
                      });
                    },
                    cursorColor: Color(0xFFdddddd),
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins-Regular",
                        color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search.. ",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white54,
                        fontFamily: "Poppins-Regular",
                      ),
                      suffixIcon: InkWell(
                        child: Icon(
                          Icons.close,
                          size: 23,
                          color: Color(0xFF888888),
                        ),
                        onTap: () {
                          setState(() {
                            textEditingController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../data/model/api_result_model.dart';
class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movieDetail';
  

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Results;    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.57,
                color: Color(0xFF333333),
                child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl:
                            "https://image.tmdb.org/t/p/w1280${routeArgs.backdropPath}",
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.57,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFF000000).withOpacity(1),
                          Colors.transparent,
                        ],
                        stops: [
                          0.2,
                          0.4,
                        ]),
                  )),
              Positioned(
                top: 30,
                left: 16,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white24),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  routeArgs.title,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontFamily: "Poppins-Bold",
                      color: Color(0xFFFBFBFB) //Color(0xFF5d59d8)
                      ),
                ),
              ),
            ],
          )
          ]));
  }
}
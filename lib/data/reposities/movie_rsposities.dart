import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_bloc/widget/api_key.dart';
import '../model/api_result_model.dart';


abstract class MovieReposity {
  Future<List<Results>> getMovies(String movieType);
  Future<List<Results>> getMoviesBySearch(String query);

}

class MovieRepositoryImpl implements MovieReposity {
  var baseUrl = "http://api.themoviedb.org/3/";

  var key = apiKey;

  @override
  Future<List<Results>> getMovies(String movieType) async{
    var response = await http.get(baseUrl + "movie/$movieType?api_key=$key");
    if (response.statusCode == 200){
      var data = json.decode(response.body);
      List<Results> movies = ApiResultModel.fromJson(data).results;
      return movies;
    }else {
      throw Exception();
    }
  }

  @override
  Future<List<Results>> getMoviesBySearch(String query) async{
    var response = await http.get(baseUrl + "search/movie?api_key=$key&query=$query");
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      List<Results> movies = ApiResultModel.fromJson(data).results;
      return movies;
    }else{
      throw Exception();
    }
  }

  

}
import 'package:douban/models/home_model.dart';
import 'package:douban/service/http_request.dart';
import 'dart:convert';

import './config.dart';
class HttpHomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async{
    final movieURL = "movie/top250?start=$start&count=${HomeConfig.movieCount}";
    final result = json.decode(await HttpRequest.request(movieURL));
     final subjects = result["subjects"];

    //map convert to model
    List<MovieItem> movies = [];

    for(var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }

    // print(movies);
   return movies;


  }

}

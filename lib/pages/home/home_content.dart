import 'package:douban/models/home_model.dart';
import 'package:douban/pages/home/widget/home_movie_item.dart';

import '../../service/home_request.dart';
import 'package:flutter/material.dart';


class MyHomeContent extends StatefulWidget {
  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  final List<MovieItem> movies = [];
  @override
  // ignore: must_call_super
  void initState() {

    HttpHomeRequest.requestMovieList(0).then((value) {
      setState(() {
        print(value);
        movies.addAll(value);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext ctx, int index) {
        return MyHomeMovieItem(movies[index]);
      }
    );
  }
}

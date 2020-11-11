

import 'package:flutter/material.dart';

// import widget
import 'package:douban/models/home_model.dart';
import 'package:douban/widget/rating.dart';
import 'package:douban/widget/dashed_line.dart';




class MyHomeMovieItem extends StatelessWidget {

  final MovieItem movie;
  MyHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:    EdgeInsets.all(8) ,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 8,
            color: Color(0xffcccccc)
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRankingHeader(),
          SizedBox( height: 8,),
          buildContent(),
          SizedBox( height: 8,),
          Text("ddd")
        ],
      ),
    );
  }

  //header
  Widget buildRankingHeader() {
    final double horizontal = 10;
    final double vertical  = 5;

    return Container(
      padding: EdgeInsets.fromLTRB(horizontal, vertical, horizontal, vertical),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 131 , 95, 36)
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  //content
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(width: 8,),
        buildContentInfo(),
        SizedBox(width: 8,),
        buildContentLine(),
        SizedBox(width: 8,),
        buildContentWish()
      ],
    );
  }

  //content image
  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(movie.imageURL, height: 150,),
      
    );
  }

  //content info
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentInfoTitle(),
          SizedBox(height: 8,),
          buildContentRating(),
          SizedBox(height: 8,),
          buildContentDes()
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child:Icon(
              Icons.play_circle_outline,
              color: Colors.redAccent,
              size: 24,
            ),
          ),
          TextSpan(
            text: "${movie.title}",
            style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
            ),
          ),
          TextSpan(
            text: "(${movie.playDate})",
            style: TextStyle(fontSize: 16),
          ),

          ],
        )
      );

  }

  Widget buildContentRating() {
    return Row(
      children: [
        MyStarRating(
          rating: movie.rating,
          size: 20,
        ),
        Text(
          "${movie.rating}",
          style: TextStyle(
            fontSize: 16
          ),
        )
      ],
    );
  }

  Widget buildContentDes() {
    //string concat
    final generesString = movie.genres.join(" ");
    final directorString = movie.director.name;
    final actorString = movie.casts.map((item) => item.name).toList().join(" ");
    return Text(
        "$generesString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildContentLine() {
    return Container(
      height: 100,
      child: MyDashedLine(
        color: Colors.pink,
        dashedwidth: .5,
        dashedHeight: 8,
        count: 10,
        axis: Axis.vertical,
      ),
    );
  }

  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/home/wish.png', width: 40,),
          Text("Wish",style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 235, 170, 60)),)
        ],
      ),
    );
  }

}

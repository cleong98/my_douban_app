import 'package:flutter/material.dart';


class MyStarRating extends StatefulWidget {
  final double rating ;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Widget unselectedIcon;
  final Color selectedColor;
  final Widget selectedIcon;
  final IconData selectedIconData;
  final IconData unselectedIconData;

  MyStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.unselectedIconData = Icons.star_border,
    this.selectedColor = const Color(0xffff0000),
    this.selectedIconData = Icons.star,
    selectedIcon,
    unselectedIcon,
  }): selectedIcon = selectedIcon ??  Icon(selectedIconData, color: selectedColor, size: size,),
        unselectedIcon = unselectedIcon ?? Icon(unselectedIconData, color: unselectedColor ,size: size, );


  @override
  _MyStarRatingState createState() => _MyStarRatingState();
}

class _MyStarRatingState extends State<MyStarRating> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
            mainAxisSize: MainAxisSize.min,
            children: buildUnselectedRatingList()
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children:buildSelectedRatingList(),
        )
      ],
    );
  }

  List <Widget> buildUnselectedRatingList() {
    return List.generate(widget.count, (index) {
      return widget.unselectedIcon;
    });
  }

  List <Widget> buildSelectedRatingList() {

    List<Widget> ratingList = [];
    final customIcon = widget.selectedIcon;

    //insert full star
    double singleValue = widget.maxRating / widget.count; // 10 / 5  = 2
    double entireValue = widget.rating / singleValue; // 7/2 = 3.5
    int entireCount = entireValue.floor(); // 3.5 -> 3
    //



    for(var i = 0 ; i < entireCount; i++) {
      ratingList.add(customIcon);
    }

    //insert some star

    double leftWidth = (entireValue - entireCount) * widget.size;
    final clipIcon = ClipRect(
      clipper:MyIconClipper(leftWidth),
      child: customIcon,
    );
    ratingList.add(clipIcon);
    if(ratingList.length > widget.count) {
      return ratingList.sublist(0,widget.count);
    }


    return ratingList;


  }


}


class MyIconClipper extends CustomClipper<Rect> {

  double width;

  MyIconClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, this.width, size.height);
  }

  //when will clip
  @override
  bool shouldReclip(MyIconClipper oldClipper) {
    return oldClipper.width != this.width;
  }


}


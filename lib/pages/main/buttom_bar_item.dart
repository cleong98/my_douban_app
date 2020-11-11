import 'package:flutter/material.dart';

class MyBottomBarItem extends BottomNavigationBarItem {
  MyBottomBarItem({String iconName, String title, double size})
      :super(
    label: title,
    icon: Image.asset('assets/images/tabbar/$iconName.png',width:size,),
    activeIcon: Image.asset('assets/images/tabbar/${iconName}_active.png',width:size,),
  );
}

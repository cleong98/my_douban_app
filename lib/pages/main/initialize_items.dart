
import 'package:flutter/material.dart';

//import widget
import 'buttom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';


List<MyBottomBarItem> items = [
  MyBottomBarItem(iconName: 'home', title: 'Home', size: 30),
  MyBottomBarItem(iconName: 'subject', title: 'Book', size: 30),
  MyBottomBarItem(iconName: 'group', title: 'Group', size: 30),
  MyBottomBarItem(iconName: 'mall', title: 'Mall', size: 30),
  MyBottomBarItem(iconName: 'profile', title: 'Me', size: 30),

];

List<Widget> pages = [
  MyHomePage(),
  MySubjectPage(),
  MySubjectPage(),
  MySubjectPage(),
  MySubjectPage(),
];
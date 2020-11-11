import 'package:flutter/material.dart';

class MySubjectPage extends StatefulWidget {
  @override
  _MySubjectPageState createState() => _MySubjectPageState();
}

class _MySubjectPageState extends State<MySubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book & Audio"
        ),
        centerTitle: true,
      ),
      body: Text("BOOK & AUDIO"),
    );
  }
}

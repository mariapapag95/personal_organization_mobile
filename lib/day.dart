import 'package:flutter/material.dart';

class Day extends StatefulWidget {
  Day({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'day',
      child: Text('youre on the next page'),
    );
  }
}

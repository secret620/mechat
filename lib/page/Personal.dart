import 'package:flutter/material.dart';

class Personal extends StatefulWidget {
  Personal({Key key}) : super(key: key);

  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: new Text('Personal.dart'),);
  }
}
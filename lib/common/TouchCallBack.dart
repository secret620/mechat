import 'package:flutter/material.dart';

class TouchCallback extends StatefulWidget {

  final Widget child;
  final VoidCallback onPressed;
  final bool isFeed;
  final Color background;

  TouchCallback( {Key key,@required this.child, @required this.onPressed, this.isFeed : true, this.background : Colors.white} ) : super(key: key);

  @override
  _TouchCallbackState createState() => _TouchCallbackState();
}

class _TouchCallbackState extends State<TouchCallback> {
  Color _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: _color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (d){
        if(widget.isFeed == false){
          return;
        }
        setState(() {
          _color = widget.background;
        });
      }
    );
  }


}
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Animator<double>(
        tween: Tween<double>(begin: 0, end: 300),
        repeats: 0,
        duration: Duration(seconds: 2),
        builder: (context, anim1, child ) => Animator<double>(
          tween: Tween<double>(begin: -1, end: 1),
          cycles: 0,
          builder: (context, anim2, child ) => Center(
            child: Transform.rotate(
              angle: anim2.value,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: anim1.value,
                width: anim1.value,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
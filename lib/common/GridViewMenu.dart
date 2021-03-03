
import 'package:flutter/material.dart';

class GridViewMenu{
  String label;
  Icon icon;
  IconData iconData;
  Color iconContainerBackgroundColor;
  GestureTapCallback click;

  GridViewMenu( this.label, { this.icon, this.iconData, this.iconContainerBackgroundColor, @required this.click} );
}
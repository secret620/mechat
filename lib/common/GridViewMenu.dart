
import 'package:flutter/material.dart';

class GridViewMenu{
  String label;
  TextStyle labelStyle;
  Icon icon;
  IconData iconData;
  Color iconContainerBackgroundColor;
  GestureTapCallback click;

  GridViewMenu( this.label, { this.icon, this.iconData, this.iconContainerBackgroundColor, this.labelStyle, @required this.click} );
}
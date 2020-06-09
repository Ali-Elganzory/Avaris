import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension HoverExtensions on Widget {

  Widget get showPointerOnHover{
    return MouseRegion(
      child: this,  // The encapsulating Widget
      cursor: SystemMouseCursors.click,
    );
  }

}
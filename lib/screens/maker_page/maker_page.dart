import 'package:flutter/material.dart';

import '../../components/navigation_bar.dart';
import './dragTargetWidget.dart';
import './draggableWidget.dart';

class MakerPage extends StatelessWidget {
  static const String routeName = "/Maker";

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: sh,
        width: sw,
        color: Colors.blueAccent,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 100,
              left: 100,
              child: DraggableTile(),
            ),
            Target(),
            NavigationBar(),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(

  //     body: Center(
  //       child: Stack(
  //         children: <Widget>[
  //           Positioned(top: 100, left: 100, child: DraggableTile()),
  //           Target(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

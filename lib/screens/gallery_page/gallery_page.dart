import 'package:flutter/material.dart';

import '../../components/navigation_bar.dart';

import './gallery.dart';

class GalleryPage extends StatelessWidget {
  static const String routeName = "/Gallery";

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        width: sw,
        height: sh,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Gallery(),
            ),
            NavigationBar(),
          ],
        ),
      ),
    );
  }
}

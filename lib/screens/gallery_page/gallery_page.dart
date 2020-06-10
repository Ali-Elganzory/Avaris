import 'package:flutter/material.dart';

import '../../components/navigation_bar.dart';

class GalleryPage extends StatelessWidget {
  static const String routeName = "/Gallery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            NavigationBar(),
          ],
        ),
      ),
    );
  }
}

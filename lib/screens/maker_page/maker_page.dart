import 'package:flutter/material.dart';

import '../../components/navigation_bar.dart';

class MakerPage extends StatelessWidget {
  static const String routeName = "/Maker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
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

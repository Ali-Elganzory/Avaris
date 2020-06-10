import 'package:flutter/material.dart';

import '../../components/navigation_bar.dart';

class IntroPage extends StatelessWidget {
  static const String routeName = "/Intro";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[400],
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

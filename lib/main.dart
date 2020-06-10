import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './providers/navigation_provider.dart';
import './providers/gallery_provider.dart';

import 'screens/intro_page/intro_page.dart';
import 'screens/gallery_page/gallery_page.dart';
import 'screens/maker_page/maker_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (ctx) => NavigationProvider(),
        ),
        ChangeNotifierProvider<GalleryProvider>(
          create: (ctx) => GalleryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Avaris',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.yellowAccent[400],
        ),
        home: IntroPage(),
        routes: {
          IntroPage.routeName: (ctx) => IntroPage(),
          GalleryPage.routeName: (ctx) => GalleryPage(),
          MakerPage.routeName: (ctx) => MakerPage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './router.dart' as router;

import './providers/navigation_provider.dart';
import './providers/gallery_provider.dart';

import './screens/intro_page/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _initialRoute = IntroPage.routeName;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (ctx) => NavigationProvider(initialRoute: _initialRoute),
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
        onGenerateRoute: router.generateRoute,
        initialRoute: _initialRoute,
        navigatorKey: NavigationProvider.navigatorKey,
      ),
    );
  }
}

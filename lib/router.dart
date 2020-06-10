import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import './screens/intro_page/intro_page.dart';
import './screens/gallery_page/gallery_page.dart';
import './screens/maker_page/maker_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case IntroPage.routeName:
      return pageRouteBuilder(settings, IntroPage());
    case GalleryPage.routeName:
      return pageRouteBuilder(settings, GalleryPage());
    case MakerPage.routeName:
      return pageRouteBuilder(settings, MakerPage());
    //  Defaults to intro page
    default:
      return pageRouteBuilder(settings, IntroPage());
  }
}

PageRouteBuilder pageRouteBuilder(RouteSettings settings, Widget page) {
  return PageRouteBuilder(
    settings: settings.arguments,
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder: (ctx, _animation, __animation) {
      return ListenableProvider(
        create: (ctx) => _animation,
        child: page,
      );
    },
  );
}

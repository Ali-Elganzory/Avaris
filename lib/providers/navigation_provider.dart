import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../screens/intro_page/intro_page.dart';
import '../screens/gallery_page/gallery_page.dart';
import '../screens/maker_page/maker_page.dart';

class NavigationProvider with ChangeNotifier {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  NavigationProvider({String initialRoute}) {
    this._currentRoute = initialRoute;
  }

  String _currentRoute;

  String get currentRoute => this._currentRoute;

  set currentRoute(String route) {
    if (this._currentRoute != route) {
      goToRoute(route);
      notifyListeners();
    }
  }

  Future<dynamic> goToRoute(String routeName) {
    this._currentRoute = routeName;
    return navigatorKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }

  final Map<String, String> _pageTitlesAndRoutes = {
    "INTRO": IntroPage.routeName,
    "GALLERY": GalleryPage.routeName,
    "MAKER": MakerPage.routeName,
  };

  Map<String, String> get pageTitlesAndRoutes => this._pageTitlesAndRoutes;
}

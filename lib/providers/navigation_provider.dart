import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../screens/intro_page/intro_page.dart';
import '../screens/gallery_page/gallery_page.dart';
import '../screens/maker_page/maker_page.dart';

class NavigationProvider with ChangeNotifier {

  static final String _homePage = IntroPage.routeName;
  String _selectedPage = _homePage;

  String get selectedPage => this._selectedPage;

  set selectedPage(String route) {
    if (this._selectedPage != route) {
      this._selectedPage = route;
      notifyListeners();
    }
  }

  final Map<String, String> _pageTitlesAndRoutes = {
    "INTRO" : IntroPage.routeName,
    "GALLERY" : GalleryPage.routeName,
    "MAKER" : MakerPage.routeName,
  };

  Map<String, String> get pageTitlesAndRoutes => this._pageTitlesAndRoutes;

}

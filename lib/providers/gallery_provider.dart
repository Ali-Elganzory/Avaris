import 'package:flutter/material.dart';

import '../components/carousel_slider.dart';

class GalleryProvider with ChangeNotifier {
  static int appsCount = 4;
  static List<int> appScreensCount = [4, 4, 4, 4];

  int selectedAppIndex = 0;

  static final GlobalKey<CarouselSliderState> appsCarouselKey = GlobalKey();
  static final List<GlobalKey<CarouselSliderState>> screensCarouselKeys =
      List.generate(
    appsCount,
    (index) {
      return GlobalKey();
    },
  );

  void selectApp(int index) {
    selectedAppIndex = index;
    notifyListeners();
  }

  static List<IconData> appsIcons = [
    Icons.ac_unit,
    Icons.access_alarms,
    Icons.account_balance,
    Icons.adb,
  ];

  static List<List<Widget>> appScreens = [
    [
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
    ],
    [
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
    ],
    [
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
    ],
    [
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
      Image.asset("images/test_pic.png"),
    ],
  ];
}

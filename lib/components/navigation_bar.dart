import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

import '../providers/navigation_provider.dart';
import '../extensions/hover_extensions.dart';

import '../utils/translate_on_hover.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _staticNavigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      width: double.maxFinite,
      height: 30,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            width: 60,
            child: Icon(
              Icons.all_inclusive,
              color: Colors.black,
              size: 30,
            ),
          ),
          Expanded(
            child: SizedBox.expand(),
          ),
          for (final pageTitleAndRoute
              in _staticNavigationProvider.pageTitlesAndRoutes.entries)
            IntrinsicWidth(
              child: NavigationBarItem(
                title: pageTitleAndRoute.key,
                route: pageTitleAndRoute.value,
              ),
            ),
          Expanded(
            child: SizedBox.expand(),
          ),
          Container(
            width: 60,
            child: Icon(
              Icons.all_inclusive,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  NavigationBarItem({
    this.title,
    this.route,
    Key key,
  }) : super(key: key);

  final String title;
  final String route;

  final _flareController = FlareControls();

  String _animationName = "open";

  @override
  Widget build(BuildContext context) {
    final _staticNavigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);

    return Selector<NavigationProvider, String>(
      selector: (_, navigator) => navigator.selectedPage,
      builder: (_, newRoute, __) {
        return Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            FlareActor(
              "flare/navigation_bar_highlight.flr",
              animation: newRoute == this.route ? "open" : null,
              fit: BoxFit.contain,
              controller: _flareController,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  if (newRoute != this.route) {
                    _staticNavigationProvider.selectedPage = this.route;
                    Navigator.of(context).pushNamed(this.route);
                  }
                },
                child: TranslateOnHover(
                  x: 0,
                  y: -3,
                  z: 0,
                  enable: newRoute != this.route,
                  child: MouseRegion(
                    cursor: MaterialStateMouseCursor.clickable,
                    child: Text(
                      this.title,
                      style: TextStyle(
                        fontFamily: "roboto",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onEnter: (e) {
                      if (newRoute != route) {
                        _flareController.play("open");
                      }
                    },
                    onExit: (e) {
                      if (newRoute != route) {
                        _flareController.play("close");
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

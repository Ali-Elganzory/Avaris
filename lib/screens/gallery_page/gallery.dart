import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/gallery_provider.dart';

import '../../components/carousel_slider.dart';

import './single_app_carousel.dart';

class Gallery extends StatelessWidget {
  Gallery({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          //  Screens Carousel Sliders
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: CarouselSlider.builder(
            key: GalleryProvider.appsCarouselKey,
            itemCount: GalleryProvider.appsCount,
            itemBuilder: (ctx, index) => SingleAppCarousel(
              index: index,
              carouselKey: GalleryProvider.screensCarouselKeys[index],
              children: GalleryProvider.appScreens[index],
            ),
            autoPlay: false,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInOutCubic,
            enableInfiniteScroll: true,
            enlargeCenterPage: false,
            initialPage: 0,
            height: 0.80 * sh,
            viewportFraction: 1.0,
            pauseAutoPlayOnTouch: Duration(seconds: 4),
            onPageChanged: (n) {
              Provider.of<GalleryProvider>(context, listen: false)
                  .selectApp(n);
            },
          ),
        ),
        Positioned(
          //  Screens Navigation
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal:
                  0.05 * sw < 20 ? 20 : 0.05 * sw > 50 ? 50 : 0.05 * sw,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // 1st part of horizontal different-app navigation
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      (GalleryProvider.appsCarouselKey.currentWidget
                              as CarouselSlider)
                          .previousPage(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                //  vertical same-app navigation
                Selector<GalleryProvider, int>(
                  selector: (context, carouselsProvider) =>
                      carouselsProvider.selectedAppIndex,
                  builder: (context, selectedAppIndex, ch) => Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            (GalleryProvider
                                    .screensCarouselKeys[
                                        selectedAppIndex %
                                            GalleryProvider.appsCount]
                                    .currentWidget as CarouselSlider)
                                .nextPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOutCubic,
                            );
                          },
                          icon: Transform.rotate(
                            angle: pi / 2,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            (GalleryProvider
                                    .screensCarouselKeys[
                                        selectedAppIndex %
                                            GalleryProvider.appsCount]
                                    .currentWidget as CarouselSlider)
                                .previousPage(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeInOutCubic,
                            );
                          },
                          icon: Transform.rotate(
                            angle: -pi / 2,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 2nd part of horizontal different-app navigation
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      (GalleryProvider.appsCarouselKey.currentWidget
                              as CarouselSlider)
                          .nextPage(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

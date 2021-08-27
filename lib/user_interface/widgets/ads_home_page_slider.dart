import 'dart:async';

import 'package:farha_app/helper/app_constants.dart';
import 'package:farha_app/user_interface/cards/advertisement_card.dart';
import 'package:flutter/material.dart';

class AdsHomePageSlider extends StatefulWidget {
  @override
  _AdsHomePageSliderState createState() => _AdsHomePageSliderState();
}

class _AdsHomePageSliderState extends State<AdsHomePageSlider> {
  int length;
  PageController pageController;
  Timer timer;
  bool isLongPressPass = false;
  @override
  void initState() {
    length = AppConstants.ads.length;
    pageController = PageController(initialPage: length * 100);

    timer = Timer.periodic(Duration(seconds: 4), (Timer t) {
      if (!isLongPressPass) {
        int nextPage = pageController.page.round() + 1;
        pageController.animateToPage(nextPage,
            duration: Duration(seconds: 2), curve: Curves.ease);
      }
    });
    pageController.addListener(() {
      if (pageController.page - pageController.page.toInt() > 0)
        isLongPressPass = true;
      else
        isLongPressPass = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTapDown: (_) {
            isLongPressPass = true;
            print("onTapDown");
          },
          onTapUp: (_) {
            isLongPressPass = false;
            print("onTapUp");
          },
          onLongPressEnd: (details) {
            isLongPressPass = false;
            print("onLongPressEnd");
          },
          child: AdvertisementCard(AppConstants.ads[(index % length)]),
        );
      },
    );
  }
}

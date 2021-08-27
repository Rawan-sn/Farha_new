import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationScaleWidget extends StatelessWidget {
  final int position;
  final double horizontalOffset;
  final double verticalOffset;
  final Widget child;

  AnimationScaleWidget(
      {this.position = 0,
      this.horizontalOffset = 0,
      this.verticalOffset = 100,
      @required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: position,
      duration: const Duration(milliseconds: 1500),
      child: SlideAnimation(
        horizontalOffset: horizontalOffset,
        verticalOffset: verticalOffset,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}

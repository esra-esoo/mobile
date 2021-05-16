import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _AniProps { opacity, translateX }

class FadeFromLeftAnimation extends StatelessWidget {
  final double order;
  final int delay;
  final int? duration;
  final int opacityDuration;
  final int transDuration;
  final Widget child;

  const FadeFromLeftAnimation({
    this.order = 1.0,
    this.delay = 300,
    this.duration, //milliseconds
    this.opacityDuration = 600, //milliseconds
    this.transDuration = 600, //milliseconds
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final _tween = MultiTween<_AniProps>()
      ..add(
        _AniProps.opacity,
        0.0.tweenTo(1.0),
        duration?.milliseconds ?? opacityDuration.milliseconds,
      )
      ..add(
        _AniProps.translateX,
        (-30.0).tweenTo(0.0),
        duration?.milliseconds ?? transDuration.milliseconds,
      );

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: Duration(milliseconds: (delay * order).round()),
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: Offset(value.get(_AniProps.translateX), 0.0),
          child: child,
        ),
      ),
    );
  }
}

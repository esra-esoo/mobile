import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _AniProps { opacity, scale }

class CustomScaleAnimation extends StatelessWidget {
  final double order;
  final int? duration;
  final int opacityDuration;
  final int scaleDuration;
  final Curve? curve;
  final double from;
  final double to;
  final Widget child;

  const CustomScaleAnimation({
    this.order = 1.0,
    this.duration,
    this.opacityDuration = 800, //milliseconds
    this.scaleDuration = 800, //milliseconds
    this.curve, //milliseconds
    this.from = 0.3,
    this.to = 1.0,
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
        _AniProps.scale,
        0.3.tweenTo(1.0),
        duration?.milliseconds ?? scaleDuration.milliseconds,
      );

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: Duration(milliseconds: (300 * order).round()),
      curve: curve ?? Curves.linear,
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.scale(
          scale: value.get(_AniProps.scale),
          child: child,
        ),
      ),
    );
  }
}

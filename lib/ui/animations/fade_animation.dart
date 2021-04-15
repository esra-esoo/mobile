import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _AniProps { opacity }

class FadeAnimation extends StatelessWidget {
  final double order;
  final int duration;
  final Widget child;

  const FadeAnimation({
    this.order = 1.0,
    this.duration = 800, //in milliseconds
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final _tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0),  duration?.milliseconds);

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: Duration(milliseconds: (300 * order).round()),
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class EaseOutFromRightAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final double begin;

  EaseOutFromRightAnimation({
    this.delay = 1,
    this.begin = 100,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
      tween: Tween<double>(begin: 100.0, end: 0.0),
      child: child,
      builder: (context, child, value) => Transform.translate(
        offset: Offset(value, 0),
        child: child,
      ),
    );
  }
}

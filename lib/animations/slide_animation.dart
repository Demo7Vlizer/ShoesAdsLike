import 'package:flutter/material.dart';

class SlideAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final bool slideUp;

  SlideAnimation(this.delay, this.child, {this.slideUp = true});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: (800 * delay).round()),
      curve: Curves.easeOutCubic,
      builder: (context, double value, child) {
        final translateY = slideUp ? (1 - value) * 30 : 0.0;
        final translateX = !slideUp ? (1 - value) * 30 : 0.0;
        
        return Transform.translate(
          offset: Offset(translateX, translateY),
          child: Opacity(
            opacity: value,
            child: Transform.scale(
              scale: 0.95 + (0.05 * value),
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
} 
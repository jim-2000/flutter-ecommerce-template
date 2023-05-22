import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// Use type `Color?` because ColorTween produces type `Color?`
class AnimatedCard {
  //

  Widget animatedWidget() {
    return PlayAnimationBuilder<double>(
      // specify tween (from 50.0 to 200.0)
      tween: Tween(begin: 5.0, end: 200.0),

      // set a duration
      duration: const Duration(seconds: 5),

      // set a curve
      curve: Curves.easeInOut,

      // use builder function
      builder: (context, value, child) {
        // apply animated value obtained from builder function parameter
        return Container(
          width: value,
          height: value,
          color: Colors.green,
          child: child,
        );
      },
      child: const Text('Hello World'),
    );
  }
}

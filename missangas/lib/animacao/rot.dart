import 'dart:math';
import 'package:flutter/material.dart';

class RotationYTransition extends AnimatedWidget {
  const RotationYTransition({
    Key? key,
    required Animation<double> turns,
    this.alignment = Alignment.center,
    this.child,
  })  : _turns = turns,
        super(key: key, listenable: turns);

  final Animation<double> _turns;
  final Alignment alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // Calcula o ângulo de rotação em radianos
    final angle = _turns.value;
    // Constrói a transformação rotacionada
    return Transform(
      transform: Matrix4.rotationY(angle),
      alignment: alignment,
      child: angle > pi / 2
          ? Transform(
              alignment: alignment,
              transform: Matrix4.rotationY(pi),
              child: Opacity(opacity: 0.0, child: child),
            )
          : child,
    );
  }
}

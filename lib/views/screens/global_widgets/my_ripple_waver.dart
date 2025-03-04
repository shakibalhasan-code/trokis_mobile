import 'package:flutter/material.dart';
import 'package:ripple_wave/ripple_wave.dart';

class MyRippleWaver extends StatelessWidget {
  final Color rippleColor;
  const MyRippleWaver({super.key, required this.rippleColor});

  @override
  Widget build(BuildContext context) {
    return RippleWave(
      child: SizedBox(),
      color: rippleColor,
      repeat: true,
    );
  }
}

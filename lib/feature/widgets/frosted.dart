import 'dart:ui';

import 'package:flutter/material.dart';

//MAKE SURE THAT CHILD HAS A COLOR WITH LOW OPACITY FOR THE EFFECT TO WORK

class Frosted extends StatelessWidget {
  const Frosted({super.key, required this.child, this.borderRadius});

  final Container child;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset('assets/images/circle.png',width: 90,height: 65,fit: BoxFit.cover,)),
        // Positioned(
        //   bottom: 0,
        //   right: 0,
        //   child: Image.asset('assets/images/circle.png',width: 60,height: 60,fit: BoxFit.cover,)),
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30,sigmaY: 30),
            child: child,
          ),
      ),
      ]
    );
  }
}
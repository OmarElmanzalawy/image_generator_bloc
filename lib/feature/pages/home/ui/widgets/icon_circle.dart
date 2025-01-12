import 'package:flutter/material.dart';

class IconCircle extends StatelessWidget {
  const IconCircle({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white54),
                color: Colors.black12,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(icon,color: Colors.white70,),
              ),
            );
  }
}
import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title, required this.icon, this.fontsize});

  final String title;
  final IconData icon;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          // textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontsize ?? 28, fontWeight: FontWeight.w300),
        ),
        Icon(icon, size: 30),
      ],
    );
  }
}

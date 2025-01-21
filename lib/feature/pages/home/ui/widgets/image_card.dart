import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.height, required this.imagePath});
  final double height;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    print(height);
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imagePath),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

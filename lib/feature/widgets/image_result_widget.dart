import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_generator_bloc/feature/constants/app_styles.dart';
import 'package:image_generator_bloc/feature/pages/prompt/ui/widgets/icon_action_button.dart';

class ImageResultWidget extends StatelessWidget {
  const ImageResultWidget({super.key, required this.image});
  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            ),
          ),
        ),
        Padding(
        padding: const EdgeInsets.only(bottom: 25.0,top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(child: child)
            Text('Enjoy Your Image!',style: AppStyles.normalHeaderStyle,),
            Expanded(child: Image(image: MemoryImage(image),fit: BoxFit.contain,)),
            const SizedBox(height: 20,),
            IconActionButton(title: 'Download', icon: Icons.download,foregroundColor: Colors.white,iconColor: Colors.white,),
            const SizedBox(height: 8,),
            IconActionButton(title: 'Return to Home', icon: Icons.home,foregroundColor: Colors.white,iconColor: Colors.white,)
          ],
        ),
      ),
      ]
    );
  }
}

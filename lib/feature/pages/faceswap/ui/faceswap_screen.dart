import 'package:flutter/material.dart';
import 'package:image_generator_bloc/feature/constants/app_styles.dart';
import 'package:image_generator_bloc/feature/pages/faceswap/ui/widgets/upload_image_card.dart';
import 'package:image_generator_bloc/feature/pages/prompt/ui/widgets/icon_action_button.dart';

class FaceswapScreen extends StatelessWidget {
  const FaceswapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Image Swap ",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Icon(Icons.swap_horiz, size: 30),
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  'Upload Original Image',
                  style: AppStyles.normalHeaderStyle.copyWith(fontSize: 20),
                ),
                Text(
                  'Retain areas outside of the face',
                  style: AppStyles.normalHeaderStyle.copyWith(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Align(alignment: Alignment.center, child: UploadImageCard()),
                const SizedBox(height: 80),
                Text(
                  'Upload Target Image',
                  style: AppStyles.normalHeaderStyle.copyWith(fontSize: 20),
                ),
                Text(
                  'Swap face from original image',
                  style: AppStyles.normalHeaderStyle.copyWith(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: UploadImageCard(
                    // icon: Icons.image,
                    text: 'Upload Swap Image',
                  ),
                ),
                const SizedBox(height: 60),
                Spacer(),
                SizedBox(
                  width: double.maxFinite,
                  child: IconActionButton(
                    title: 'Do some Magic',
                    icon: Icons.generating_tokens,
                    foregroundColor: Colors.white,
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

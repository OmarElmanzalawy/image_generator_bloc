import 'package:flutter/material.dart';
import 'package:image_generator_bloc/feature/constants/app_styles.dart';
import 'package:image_generator_bloc/feature/pages/faceswap/ui/widgets/upload_image_card.dart';
import 'package:image_generator_bloc/feature/pages/prompt/ui/widgets/icon_action_button.dart';
import 'package:image_generator_bloc/feature/widgets/screen_title.dart';

class BackgroundRemovalScreen extends StatelessWidget {
  const BackgroundRemovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.center,
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
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  ScreenTitle(title: "Background Removal ", icon: Icons.texture,fontsize: 24,),
                  const SizedBox(height: 50),
                    // alignment: Alignment.center,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Pick Image",style: AppStyles.normalHeaderStyle,),
                        Text(
                          'Make sure that the image is high resolution for effective background removal',
                          style: AppStyles.normalHeaderStyle.copyWith(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        UploadImageCard(
                          padding: 100,
                          ontap: (){

                          },
                          ),
                        const SizedBox(height: 25,),
                        SizedBox(
                          width: double.maxFinite,
                          child: IconActionButton(
                            title: "Remove Background",
                             icon: Icons.generating_tokens,
                             foregroundColor: Colors.white,
                             iconColor: Colors.white,
                             ),
                        )
                      ],
                    ),
                ],
              ),
            )
        ],
      )
    );
  }
}
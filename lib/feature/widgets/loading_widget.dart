import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:image_generator_bloc/utils/app_utils.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({super.key});

  final Future<LottieComposition> loadingAnimation =
      AssetLottie(
        'assets/animations/loading2.lottie',
        decoder: AppUtils.customDecoder,
      ).load();

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
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FutureBuilder(
                        future: loadingAnimation,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done &&
                              snapshot.hasData) {
                            return Lottie(composition: snapshot.data);
                          } else {
                            return CircularProgressIndicator.adaptive();
                          }
                        },
                      ),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          'Doing Some Magic!',
                          textStyle: TextStyle(
                            fontSize: 20,
                            // letterSpacing: 5,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                      isRepeatingAnimation: true,
                      repeatForever: true,
                    ),
                  ]
      ),
      ]
    );
  }
}
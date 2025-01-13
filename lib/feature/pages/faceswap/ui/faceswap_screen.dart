import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_generator_bloc/feature/constants/app_styles.dart';
import 'package:image_generator_bloc/feature/pages/faceswap/bloc/faceswap_bloc.dart';
import 'package:image_generator_bloc/feature/pages/faceswap/ui/widgets/upload_image_card.dart';
import 'package:image_generator_bloc/feature/pages/prompt/ui/widgets/icon_action_button.dart';
import 'package:image_generator_bloc/feature/widgets/image_result_widget.dart';
import 'package:image_generator_bloc/feature/widgets/loading_widget.dart';

class FaceswapScreen extends StatelessWidget {
  FaceswapScreen({super.key});

  final FaceswapBloc faceswapBloc = FaceswapBloc();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: BlocConsumer<FaceswapBloc, FaceswapState>(
        bloc: faceswapBloc,
        buildWhen: (previous, current) => current is !FaceswapActionState,
        listenWhen: (previous,current) => current is FaceswapActionState,
        listener: (context, state) {
          if(state is FaceswapImageGeneratedFailureState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occured while loading the image')));
          }
        },
        builder: (context, state) {
          
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 700),
            child: state is FaceswapLoadingState 
            ? 
            LoadingWidget() 
            : 
            Stack(
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
                      state is FaceswapImageGeneratedSuccessState 
                      ?
                      ImageResultWidget(image: state.image)
                      :
                      Text(
                            'Upload Original Image',
                            style: AppStyles.normalHeaderStyle.copyWith(fontSize: 20),
                          ),
                      state is FaceswapImageSelectedState && state.sourceImagePath !=null ? const SizedBox(height: 10,) : const SizedBox(),
                      //Source Image
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 700),
                        child: state is FaceswapImageSelectedState && state.sourceImagePath != null 
                        ? 
                          Image.file(File(state.sourceImagePath!),width: double.maxFinite,height: 200,fit: BoxFit.fitHeight,)
                          : 
                          //TODO REFACTOR THEESE INTO THEIR OWN CUSTOM WIDGET
                          Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                                     Text(
                        'Retain areas outside of the face',
                        style: AppStyles.normalHeaderStyle.copyWith(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: UploadImageCard(
                          ontap: (){
                            faceswapBloc.add(SourceImageClickedEvent());
                          },
                        ),
                      ),
                        ],
                      ), 
                        ),
                     
                      const SizedBox(height: 80),
                      Text(
                        'Upload Target Image',
                        style: AppStyles.normalHeaderStyle.copyWith(fontSize: 20),
                      ),
                      state is FaceswapImageSelectedState && state.targetImagePath !=null ? const SizedBox(height: 10,) : const SizedBox(),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 700),
                        child: state is FaceswapImageSelectedState && state.targetImagePath != null 
                        ?
                         Image.file(File(state.targetImagePath!),width: double.maxFinite,height: 200,fit: BoxFit.fitHeight,)
                         :
                           Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                           ontap: (){
                            faceswapBloc.add(TargetImageClickedEvent());
                          },
                        ),
                      ),
                        ],
                      ),
                        ),
                      const SizedBox(height: 40),
                      Spacer(),
                      SizedBox(
                        width: double.maxFinite,
                        child: IconActionButton(
                          title: 'Do some Magic',
                          icon: Icons.generating_tokens,
                          foregroundColor: Colors.white,
                          iconColor: Colors.white,
                          onpressed: () {
                            //TODO HANDLE ERROR CASES LATER
                            //SUCH AS IMAGE NOT SELECTED YET AND USER CLICK ON BUTTON
                            final images = state as FaceswapImageSelectedState;
                            faceswapBloc.add(FaceswapGenerateButtonClickEvent(sourceImageUrl: state.sourceImagePath!, targetImageUrl: state.targetImagePath!));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

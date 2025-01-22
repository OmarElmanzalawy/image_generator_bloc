import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_generator_bloc/data/repos/api_repo.dart';
import 'package:image_generator_bloc/feature/pages/prompt/bloc/prompt_bloc.dart';
import 'package:image_generator_bloc/utils/app_utils.dart';
import 'package:lottie/lottie.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  final TextEditingController _promptController = TextEditingController();
  final PromptBloc promptBloc = PromptBloc();
  final Future<LottieComposition> loadingAnimation =
      AssetLottie(
        'assets/animations/loading2.lottie',
        decoder: AppUtils.customDecoder,
      ).load();

  @override
  void initState() {
    promptBloc.add(PromptInitialEvent());
    super.initState();
    // loadingAnimation = AssetLottie('assets/animations/loading2.lottie',decoder: AppUtils.customDecoder).load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _promptController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(centerTitle: true,
       title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Generate Images'),
      ),backgroundColor: Colors.transparent,),
      body: BlocConsumer<PromptBloc, PromptState>(
        bloc: promptBloc,
        listener: (context, state) {
          // TODO: implement listener
        },

        builder: (context, state) {
          switch (state.runtimeType) {
            case PromptLoadingImageState:
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
                    // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.1,),
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
                  ],
                ),
                ],
              );

            case PromptGeneratedImageFailure:
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
                  children: [
                    const SizedBox(height: 100),
                    Icon(Icons.cancel, color: Colors.deepPurple, size: 200),
                    Text(
                      'Something went wrong\n try another prompt',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                TextField(
                                  controller: _promptController,
                                  cursorColor: Colors.deepPurple,
                                  decoration: InputDecoration(
                                    hintText: 'Generate a picture of a cat',
                                    hintStyle: TextStyle(color: Colors.white30),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                                                InkWell(
                                  onTap: () async{
                                 await ApiRepo.generateImage(_promptController.text);
                                  if (_promptController.text.isNotEmpty) {
                                    promptBloc.add(
                                      PromptEnteredEvent(
                                        prompt: _promptController.text,
                                      ),
                                    );
                                  }
                                  },
                                  child: Container(
                                    // padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Icon(Icons.send,color: Colors.white,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ],
              );
            case PromptGeneratedSuccessState:
              final successState = state as PromptGeneratedSuccessState;
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
                  Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 120,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(successState.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.topLeft,
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter your prompt',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _promptController,
                                    cursorColor: Colors.deepPurple,
                                    decoration: InputDecoration(
                                      hintText: 'Generate a picture of a cat',
                                      hintStyle: TextStyle(color: Colors.white30),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                        borderSide: BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                InkWell(
                                  onTap: () async{
                                //  await ApiRepo.generateImage(_promptController.text);
                                  if (_promptController.text.isNotEmpty) {
                                    promptBloc.add(
                                      PromptEnteredEvent(
                                        prompt: _promptController.text,
                                      ),
                                    );
                                  }
                                  },
                                  child: Container(
                                    // padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Icon(Icons.send,color: Colors.white,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ],
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

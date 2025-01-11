import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_generator_bloc/data/repos/api_repo.dart';
import 'package:image_generator_bloc/feature/prompt/bloc/prompt_bloc.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  final TextEditingController _promptController = TextEditingController();
  final PromptBloc promptBloc = PromptBloc();
  
  @override
  void initState() {

    promptBloc.add(PromptInitialEvent());
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(centerTitle: true, title: Text('Generate Images🚀')),
          body: BlocConsumer<PromptBloc, PromptState>(
      bloc: promptBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case PromptLoadingImageState:
              return Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.deepPurple,),);
          case PromptGeneratedImageFailure:
            return Center(child: Column(
              children: [
                Text('Something went wrong, try another prompt'),
                 const SizedBox(height: 8),
                      TextField(
                        controller: _promptController,
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          hintText: 'Generate a picture of a cat',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.maxFinite,
                        height: 48,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.deepPurple,
                            ),
                          ),
                          onPressed: () {
                            // await ApiRepo.generateImage(_promptController.text);
                          },
                          icon: Icon(Icons.generating_tokens),
                          label: Text('Generate'),
                        ),
                      ),
              ],
            ),);
          case PromptGeneratedSuccessState:
            final successState = state as PromptGeneratedSuccessState;
            return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: 
                  Container(
                    decoration: BoxDecoration(image: DecorationImage(image: MemoryImage(successState.image),fit: BoxFit.cover)),
                  )),

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
                      const SizedBox(height: 8),
                      TextField(
                        controller: _promptController,
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          hintText: 'Generate a picture of a cat',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.maxFinite,
                        height: 48,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.deepPurple,
                            ),
                          ),
                          onPressed: () {
                            // await ApiRepo.generateImage(_promptController.text);
                            if(_promptController.text.isNotEmpty){
                            promptBloc.add(PromptEnteredEvent(prompt: _promptController.text));
                            }
                          },
                          icon: Icon(Icons.generating_tokens),
                          label: Text('Generate'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
    
          default: return const SizedBox();
        }
          
          
          
      },
    ),
        );
  }
}

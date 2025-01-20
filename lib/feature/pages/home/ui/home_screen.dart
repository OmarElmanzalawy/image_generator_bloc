import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_generator_bloc/feature/pages/home/bloc/home_bloc_bloc.dart';
import 'package:image_generator_bloc/feature/pages/home/ui/widgets/mode_card.dart';
import 'package:image_generator_bloc/feature/widgets/image_result_widget.dart';
import 'package:image_generator_bloc/feature/widgets/loading_widget.dart';
import 'package:image_generator_bloc/utils/app_utils.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = HomeBlocBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(FetchImagesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(text: 'Image',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25),
          children: [
            TextSpan(
              text: 'AI',
              style: TextStyle(color: Colors.deepPurpleAccent)
            )
          ]
          ),
          
          ),
      ),
      body: Stack(
        children: [Container(
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
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120,),
              Text("Hello,",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),),
              Text("Omar Elmanzalawy",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
              SizedBox(height: 10,),
              Divider(color: Colors.white12,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ModeCard(
                    name: 'Text to Image',
                    routePath: '/createPrompt',
                    icon: Icons.chat_bubble_outline,
                  ),
                  ModeCard(
                    name: 'Faceswap',
                    routePath: '/faceswap',
                    icon: Icons.face_6_outlined,
                  ),
                ],
              ),
              SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: ModeCard(
                      name: 'Background Removal',
                      routePath: '/backgroundRemoval',
                      icon: Icons.wallpaper,
                      width: 360,
                    ),
                  ),
            const SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.12),
              child: Text("Generated Images: ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),),
            ),
            BlocBuilder(
              bloc: homeBloc,
              builder: (context,state){
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                //  child: state is HomeBlocLoadingState 
                // ?
                //  Center(
                //   child: CircularProgressIndicator.adaptive(backgroundColor: Colors.deepPurple,),
                // )
                // : state is HomeBlocImagesFetchedFailureState ?
                // Center(child: Text('An error eccured while loading Images'),),
                // :
                //TODO COMPLETE THE LIST VIEW UI
                //MAKE THE DESIGN LIKE THIS: https://dribbble.com/shots/22585172-AI-Artificial-Intelligence-Image-Generator-Mobile-App-Design
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context,index){

                  },
                  ),
                );

              })
       ],
          ),
        )
        ]
      ),
    );
  }
}
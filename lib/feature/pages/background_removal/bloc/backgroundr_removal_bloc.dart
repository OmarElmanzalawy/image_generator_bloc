import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:image_generator_bloc/data/repos/api_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'backgroundr_removal_event.dart';
part 'backgroundr_removal_state.dart';

class BackgroundrRemovalBloc extends Bloc<BackgroundrRemovalEvent, BackgroundrRemovalState> {

  final ImagePicker _picker = ImagePicker();

  String? imagePath;
  

  BackgroundrRemovalBloc() : super(BackgroundrRemovalInitial()) {
    on<BackgroudRemovalImageSelectionEvent>(backgroudRemovalImageSelectionEvent);
    on<BackgroundRemovalSubmitButtonClickEvent>(backgroundRemovalSubmitButtonClickEvent);
    
  }

  FutureOr<void> backgroudRemovalImageSelectionEvent(BackgroudRemovalImageSelectionEvent event, Emitter<BackgroundrRemovalState> emit) async{

       final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
        imagePath = pickedFile.path;
        emit(BackgroundRemovalPictureSelected(
          imagePath: imagePath
        ));
      }

  }

  FutureOr<void> backgroundRemovalSubmitButtonClickEvent(BackgroundRemovalSubmitButtonClickEvent event, Emitter<BackgroundrRemovalState> emit) async{

        emit(BackgroundRemovalLoadingState());
    final Uint8List? image = await ApiRepo.removeBackground(imageUrl: event.image);
    await Future.delayed(Duration(milliseconds: 1500));
    if(image != null){
      emit(BackgroundRemovalImageGeneratedSuccessState(imagePath: image));
    }
    else{
      emit(BackgroundRemovalImageGenerateFailureState()); 
    }

  }
}

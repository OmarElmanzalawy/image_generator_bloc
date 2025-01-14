import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'backgroundr_removal_event.dart';
part 'backgroundr_removal_state.dart';

class BackgroundrRemovalBloc extends Bloc<BackgroundrRemovalEvent, BackgroundrRemovalState> {

  final ImagePicker _picker = ImagePicker();

  String? imagePath;
  

  BackgroundrRemovalBloc() : super(BackgroundrRemovalInitial()) {
    on<BackgroudRemovalImageSelectionEvent>(backgroudRemovalImageSelectionEvent);
    
  }

  FutureOr<void> backgroudRemovalImageSelectionEvent(BackgroudRemovalImageSelectionEvent event, Emitter<BackgroundrRemovalState> emit) async{

       final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
        // _targetImagePath = pickedFile.path;
        // emit(FaceswapImageSelectedState(
        //   targetImagePath: _targetImagePath,
        //   sourceImagePath: _sourceImagePath,
        // ));
        imagePath = pickedFile.path;
        emit(BackgroundRemovalPictureSelected(
          imagePath: imagePath
        ));
      }

  }
}

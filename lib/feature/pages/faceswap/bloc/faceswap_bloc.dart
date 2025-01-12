import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'faceswap_event.dart';
part 'faceswap_state.dart';

class FaceswapBloc extends Bloc<FaceswapEvent, FaceswapState> {
  final ImagePicker _picker = ImagePicker();

  String? _targetImagePath;
  String? _sourceImagePath;

  FaceswapBloc() : super(FaceswapInitial()) {
    on<TargetImageClickedEvent>(targetImageClickedEvent);
    on<SourceImageClickedEvent>(sourceImageClickedEvent);
  }

  FutureOr<void> targetImageClickedEvent(TargetImageClickedEvent event, Emitter<FaceswapState> emit) async{

    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
        _targetImagePath = pickedFile.path;
        emit(FaceswapImageSelectedState(
          targetImagePath: _targetImagePath,
          sourceImagePath: _sourceImagePath,
        ));
      }

  }

  FutureOr<void> sourceImageClickedEvent(SourceImageClickedEvent event, Emitter<FaceswapState> emit) async{

      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
        _sourceImagePath = pickedFile.path;
        emit(FaceswapImageSelectedState(
          targetImagePath: _targetImagePath,
          sourceImagePath: _sourceImagePath,
        ));
      }
  }
}

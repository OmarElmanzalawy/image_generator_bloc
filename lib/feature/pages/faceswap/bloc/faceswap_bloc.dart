import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:image_generator_bloc/data/repos/api_repo.dart';
import 'package:image_generator_bloc/utils/app_utils.dart';
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
    on<FaceswapGenerateButtonClickEvent>(faceswapGenerateButtonClickEvent);
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

  FutureOr<void> faceswapGenerateButtonClickEvent(FaceswapGenerateButtonClickEvent event, Emitter<FaceswapState> emit) async{

    emit(FaceswapLoadingState());
    final Uint8List? image = await ApiRepo.faceSwap(sourceUrl: event.sourceImageUrl,targetUrl: event.targetImageUrl);
    // final Uint8List? image = await AppUtils.convertAssetToUint8List('assets/images/cat.png');
    await Future.delayed(Duration(milliseconds: 1500));
    if(image != null){
      emit(FaceswapImageGeneratedSuccessState(image: image));
    }
    else{
      emit(FaceswapImageGeneratedFailureState()); 
    }
  }
}

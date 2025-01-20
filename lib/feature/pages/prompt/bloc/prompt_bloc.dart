import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_generator_bloc/data/repos/api_repo.dart';
import 'package:image_generator_bloc/utils/app_utils.dart';
import 'package:meta/meta.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptEnteredEvent>(promptEnteredEvent);
    on<PromptInitialEvent>(promptInitialEvent);
  }

  FutureOr<void> promptEnteredEvent(PromptEnteredEvent event, Emitter<PromptState> emit)async {
    emit(PromptLoadingImageState());
    Uint8List? image = await ApiRepo.generateImage(event.prompt);
    await Future.delayed(Duration(milliseconds: 1500));
    if(image != null){
      emit(PromptGeneratedSuccessState(image: image));
    }
    else{
      emit(PromptGeneratedImageFailure());
    }
  }

  

  FutureOr<void> promptInitialEvent(PromptInitialEvent event, Emitter<PromptState> emit) async{
    final Uint8List? image = await AppUtils.convertAssetToUint8List('assets/images/cat.png');
    if(image != null){
      emit(PromptGeneratedSuccessState(image: image));
      // emit(PromptGeneratedImageFailure());
      // emit(PromptLoadingImageState());
    }
    else{
      emit(PromptGeneratedImageFailure());
    }
  }
}

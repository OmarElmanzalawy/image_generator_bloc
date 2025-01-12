import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'faceswap_event.dart';
part 'faceswap_state.dart';

class FaceswapBloc extends Bloc<FaceswapEvent, FaceswapState> {
  FaceswapBloc() : super(FaceswapInitial()) {
    on<TargetImageClickedEvent>(targetImageClickedEvent);
    on<SourceImageClickedEvent>(sourceImageClickedEvent);
  }

  FutureOr<void> targetImageClickedEvent(TargetImageClickedEvent event, Emitter<FaceswapState> emit) {
  }

  FutureOr<void> sourceImageClickedEvent(SourceImageClickedEvent event, Emitter<FaceswapState> emit) {
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_generator_bloc/data/repos/api_repo.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeBlocEvent>(homeBlocEvent);
  }

  FutureOr<void> homeBlocEvent(HomeBlocEvent event, Emitter<HomeBlocState> emit) async{
    emit(HomeBlocLoadingState());
    final images = await ApiRepo.fetchImages();
    print("IMAGES LIST: $images");
    if(images != null && images.isNotEmpty ){
      emit(HomeBlocImagesFetchedSuccessState(images: images));
    }
    else{
      emit(HomeBlocImagesFetchedFailureState());
    }
  }
}

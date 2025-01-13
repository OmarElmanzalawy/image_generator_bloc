part of 'faceswap_bloc.dart';

@immutable
sealed class FaceswapState {}

sealed class FaceswapActionState extends FaceswapState{}

final class FaceswapInitial extends FaceswapState {}

final class FaceswapImageSelectedState extends FaceswapState{
  final String? targetImagePath;
  final String? sourceImagePath;

  FaceswapImageSelectedState({this.targetImagePath,this.sourceImagePath});
}

final class FaceswapLoadingState extends FaceswapState{}

final class FaceswapImageGeneratedSuccessState extends FaceswapState{
  final Uint8List image;

  FaceswapImageGeneratedSuccessState({required this.image});
}

final class FaceswapImageGeneratedFailureState extends FaceswapActionState{}

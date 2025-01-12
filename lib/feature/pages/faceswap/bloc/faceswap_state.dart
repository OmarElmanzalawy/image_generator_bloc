part of 'faceswap_bloc.dart';

@immutable
sealed class FaceswapState {}

final class FaceswapInitial extends FaceswapState {}

final class FaceswapImageSelectedState extends FaceswapState{
  final String? targetImagePath;
  final String? sourceImagePath;

  FaceswapImageSelectedState({this.targetImagePath,this.sourceImagePath});
}

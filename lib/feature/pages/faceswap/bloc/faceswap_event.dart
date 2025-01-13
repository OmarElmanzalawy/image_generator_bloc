part of 'faceswap_bloc.dart';

@immutable
sealed class FaceswapEvent {}

final class SourceImageClickedEvent extends FaceswapEvent{

}

final class TargetImageClickedEvent extends FaceswapEvent{}

final class FaceswapGenerateButtonClickEvent extends FaceswapEvent{
  final String sourceImageUrl;
  final String targetImageUrl;

  FaceswapGenerateButtonClickEvent({required this.sourceImageUrl, required this.targetImageUrl});
}



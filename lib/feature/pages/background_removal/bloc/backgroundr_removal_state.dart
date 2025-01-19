part of 'backgroundr_removal_bloc.dart';

@immutable
sealed class BackgroundrRemovalState {}

sealed class BackgroundrRemovalActionState extends BackgroundrRemovalState {}

final class BackgroundrRemovalInitial extends BackgroundrRemovalState {}

final class BackgroundRemovalPictureSelected extends BackgroundrRemovalState{

  final String? imagePath;

  BackgroundRemovalPictureSelected({required this.imagePath});
}

final class BackgroundRemovalLoadingState extends BackgroundrRemovalState{}

final class BackgroundRemovalImageGeneratedSuccessState extends BackgroundrRemovalState{
  final Uint8List imagePath;


  BackgroundRemovalImageGeneratedSuccessState({required this.imagePath});}

final class BackgroundRemovalImageGenerateFailureActionState extends BackgroundrRemovalActionState{}



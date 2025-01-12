part of 'prompt_bloc.dart';

@immutable
sealed class PromptState {}

final class PromptInitial extends PromptState {}

final class PromptLoadingImageState extends PromptState{}

final class PromptGeneratedSuccessState extends PromptState{
  final Uint8List image;

  PromptGeneratedSuccessState({required this.image});
}

final class PromptGeneratedImageFailure extends PromptState{}

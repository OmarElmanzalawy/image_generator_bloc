part of 'prompt_bloc.dart';

@immutable
sealed class PromptEvent {}

final class PromptInitialEvent extends PromptEvent{}

final class PromptEnteredEvent extends PromptEvent{
  final String prompt;

  PromptEnteredEvent({required this.prompt});
}

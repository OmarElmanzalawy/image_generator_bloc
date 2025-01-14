part of 'backgroundr_removal_bloc.dart';

@immutable
sealed class BackgroundrRemovalEvent {}

final class BackgroudRemovalImageSelectionEvent extends BackgroundrRemovalEvent{}

final class BackgroundRemovalSubmitButtonClick extends BackgroundrRemovalEvent{
  final String image;

  BackgroundRemovalSubmitButtonClick({required this.image});
  
}

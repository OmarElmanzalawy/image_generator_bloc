part of 'backgroundr_removal_bloc.dart';

@immutable
sealed class BackgroundrRemovalEvent {}

final class BackgroudRemovalImageSelectionEvent extends BackgroundrRemovalEvent{}

final class BackgroundRemovalSubmitButtonClickEvent extends BackgroundrRemovalEvent{
  final String image;

  BackgroundRemovalSubmitButtonClickEvent({required this.image});
  
}

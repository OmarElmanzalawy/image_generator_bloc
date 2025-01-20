part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

final class HomeBlocImagesFetchedSuccessState extends HomeBlocState{
  final List<String>? images;

  HomeBlocImagesFetchedSuccessState({required this.images});

  }

final class HomeBlocImagesFetchedFailureState extends HomeBlocState{}

final class HomeBlocLoadingState extends HomeBlocState{}

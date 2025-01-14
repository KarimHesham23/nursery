part of 'fetch_cubit.dart';

@immutable
sealed class FetchState {}

final class FetchInitial extends FetchState {}

final class FetchFaileur extends FetchState {
  final String errorMessage;

  FetchFaileur({required this.errorMessage});
}

final class FetchSuccess extends FetchState {
  final Readings readings;

  FetchSuccess({required this.readings});
}

final class FetchLoading extends FetchState {}

part of 'predict_cubit.dart';

@immutable
sealed class PredictState {}

final class PredictInitial extends PredictState {}

final class PredictFaileur extends PredictState {
  final String errorMessage;

  PredictFaileur({required this.errorMessage});
}

final class PredictSuccess extends PredictState {}

final class PredictLoading extends PredictState {}

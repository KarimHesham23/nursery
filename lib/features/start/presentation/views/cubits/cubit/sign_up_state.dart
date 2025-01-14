part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpFaileur extends SignUpState {
  final String errorMessage;

  SignUpFaileur({required this.errorMessage});
}

final class SignUpSuccess extends SignUpState {}

final class SignUpLoading extends SignUpState {}

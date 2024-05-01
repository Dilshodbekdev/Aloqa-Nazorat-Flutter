part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginBody body;

  const LoginEvent({required this.body});
}

class ConfirmationEvent extends AuthEvent {
  final ConfirmationBody body;

  const ConfirmationEvent({required this.body});
}

class OneIdEvent extends AuthEvent {
  final OneIdBody body;

  const OneIdEvent({required this.body});
}

class RegisterEvent extends AuthEvent {
  final RegisterBody body;

  const RegisterEvent({required this.body});
}

class RecoverPasswordEvent extends AuthEvent {
  final RecoverPasswordBody body;

  const RecoverPasswordEvent({required this.body});
}

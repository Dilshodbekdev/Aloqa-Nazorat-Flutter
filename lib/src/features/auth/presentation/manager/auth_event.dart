part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginBody body;

  LoginEvent({required this.body});
}
//
// class NameEvent extends AuthEvent {}

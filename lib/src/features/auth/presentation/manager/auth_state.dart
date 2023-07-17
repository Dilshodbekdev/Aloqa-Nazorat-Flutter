part of 'auth_bloc.dart';

class AuthState {
  final LoginModel? loginModel;
  final bool isLoginVerified;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  AuthState({
    this.loginModel,
    this.isLoginVerified = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  AuthState copyWith({
    LoginModel? loginModel,
    bool? isLoading,
    bool? isLoginVerified,
    bool? hasError,
    String? errorMessage,
  }) =>
      AuthState(
        loginModel: loginModel ?? this.loginModel,
        isLoginVerified: isLoginVerified ?? false,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

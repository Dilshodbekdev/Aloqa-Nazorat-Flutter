part of 'auth_bloc.dart';

class AuthState {
  final LoginModel? loginModel;
  final RegisterModel? registerModel;
  final PasswordRestoreModel? recoverPasswordModel;
  final LoginModel? confirmation;
  final LoginModel? oneIdModel;
  final bool isLoginVerified;
  final bool isOneIdVerified;
  final bool isRegisterVerified;
  final bool isConfirmationVerified;
  final bool isRecoverPasswordVerified;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  AuthState({
    this.loginModel,
    this.registerModel,
    this.recoverPasswordModel,
    this.confirmation,
    this.oneIdModel,
    this.isLoginVerified = false,
    this.isOneIdVerified = false,
    this.isRegisterVerified = false,
    this.isConfirmationVerified = false,
    this.isRecoverPasswordVerified = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  AuthState copyWith({
    LoginModel? loginModel,
    RegisterModel? registerModel,
    PasswordRestoreModel? recoverPasswordModel,
    LoginModel? confirmation,
    LoginModel? oneIdModel,
    bool? isLoading,
    bool? isLoginVerified,
    bool? isOneIdVerified,
    bool? isRegisterVerified,
    bool? isConfirmationVerified,
    bool? isRecoverPasswordVerified,
    bool? hasError,
    String? errorMessage,
  }) =>
      AuthState(
        loginModel: loginModel ?? this.loginModel,
        registerModel: registerModel ?? this.registerModel,
        recoverPasswordModel: recoverPasswordModel ?? this.recoverPasswordModel,
        confirmation: confirmation ?? this.confirmation,
        oneIdModel: oneIdModel ?? this.oneIdModel,
        isLoginVerified: isLoginVerified ?? false,
        isOneIdVerified: isOneIdVerified ?? false,
        isRegisterVerified: isRegisterVerified ?? false,
        isConfirmationVerified: isConfirmationVerified ?? false,
        isRecoverPasswordVerified: isRecoverPasswordVerified ?? false,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

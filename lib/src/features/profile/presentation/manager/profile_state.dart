part of 'profile_bloc.dart';

class ProfileState {
  final LoginModel? loginModel;
  final ResendCodeModel? uploadModel;
  final DeleteAccountModel? deleteAccountModel;
  final bool isLoginVerified;
  final bool isAccountDeleted;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  ProfileState({
    this.loginModel,
    this.uploadModel,
    this.deleteAccountModel,
    this.isLoginVerified = false,
    this.isAccountDeleted = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  ProfileState copyWith({
    LoginModel? loginModel,
    ResendCodeModel? uploadModel,
    DeleteAccountModel? deleteAccountModel,
    bool? isLoading,
    bool? isLoginVerified,
    bool? isAccountDeleted,
    bool? hasError,
    String? errorMessage,
  }) =>
      ProfileState(
        loginModel: loginModel ?? this.loginModel,
        uploadModel: uploadModel ?? this.uploadModel,
        deleteAccountModel: deleteAccountModel ?? this.deleteAccountModel,
        isLoginVerified: isLoginVerified ?? false,
        isAccountDeleted: isAccountDeleted ?? false,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

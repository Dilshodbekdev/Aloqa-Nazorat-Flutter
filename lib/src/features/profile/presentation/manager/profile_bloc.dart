import 'dart:async';
import 'dart:io';

import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/resend_code_model.dart';
import 'package:aloqa_nazorat/src/features/profile/data/body/change_password_body.dart';
import 'package:aloqa_nazorat/src/features/profile/data/models/delete_account_model.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/use_case/change_password_use_case.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/use_case/delete_account_use_case.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/use_case/upload_photo_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ChangePasswordUseCase _changePasswordUseCase;
  final UploadPhotoUseCase _uploadPhotoUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;

  ProfileBloc(
    this._changePasswordUseCase,
    this._uploadPhotoUseCase,
    this._deleteAccountUseCase,
  ) : super(ProfileState()) {
    on<ChangePasswordEvent>((event, emit) async {
      await emit.onEach(_onChangePassword(event), onData: emit);
    });

    on<UploadPhotoEvent>((event, emit) async {
      await emit.onEach(_onUploadPhoto(event), onData: emit);
    });

    on<DeleteAccountEvent>((event, emit) async {
      await emit.onEach(_onDeleteAccount(event), onData: emit);
    });
  }

  changePassword({required ChangePasswordBody body}) {
    add(ChangePasswordEvent(body: body));
  }

  uploadPhoto({required File file}) {
    add(UploadPhotoEvent(file: file));
  }

  deleteAccount() {
    add(DeleteAccountEvent());
  }

  Stream<ProfileState> _onChangePassword(ChangePasswordEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _changePasswordUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(loginModel: dataState.data, isLoginVerified: true);
      Prefs.setString(AppConstants.kToken, dataState.data?.token ?? "");
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<ProfileState> _onUploadPhoto(UploadPhotoEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _uploadPhotoUseCase.call(params: event.file);

    if (dataState is DataSuccess) {
      yield state.copyWith(uploadModel: dataState.data, isLoginVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<ProfileState> _onDeleteAccount(DeleteAccountEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _deleteAccountUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          deleteAccountModel: dataState.data, isAccountDeleted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}

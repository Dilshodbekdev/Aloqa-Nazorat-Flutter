import 'dart:async';
import 'dart:convert';

import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/confirmation_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/login_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/one_id_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/recover_password_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/register_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/password_restore_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/register_model.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/confirmation_use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/one_id_use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/recover_password_use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/regsiter_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final ConfirmationUseCase _confirmationUseCase;
  final OneIdUseCase _oneIdUseCase;
  final RecoverPasswordUseCase _recoverPasswordUseCase;

  AuthBloc(
    this._loginUseCase,
    this._registerUseCase,
    this._confirmationUseCase,
    this._oneIdUseCase,
    this._recoverPasswordUseCase,
  ) : super(AuthState()) {
    on<LoginEvent>((event, emit) async {
      await emit.onEach(_onLogin(event), onData: emit);
    });

    on<RegisterEvent>((event, emit) async {
      await emit.onEach(_onRegister(event), onData: emit);
    });

    on<ConfirmationEvent>((event, emit) async {
      await emit.onEach(_onConfirmation(event), onData: emit);
    });

    on<OneIdEvent>((event, emit) async {
      await emit.onEach(_onOneId(event), onData: emit);
    });

    on<RecoverPasswordEvent>((event, emit) async {
      await emit.onEach(_onRecoverPassword(event), onData: emit);
    });
  }

  login({required LoginBody body}) {
    add(LoginEvent(body: body));
  }

  confirmation({required ConfirmationBody body}) {
    add(ConfirmationEvent(body: body));
  }

  oneId({required OneIdBody body}) {
    add(OneIdEvent(body: body));
  }

  register({required RegisterBody body}) {
    add(RegisterEvent(body: body));
  }

  recoverPassword({required RecoverPasswordBody body}) {
    add(RecoverPasswordEvent(body: body));
  }

  Stream<AuthState> _onOneId(OneIdEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _oneIdUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(oneIdModel: dataState.data, isOneIdVerified: true);
      Prefs.setString(AppConstants.kToken, dataState.data?.token ?? "");
      Prefs.setString(
          AppConstants.kUser, jsonEncode(dataState.data?.data?.toJson()));
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onConfirmation(ConfirmationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _confirmationUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(confirmation: dataState.data, isConfirmationVerified: true);
      Prefs.setString(AppConstants.kToken, dataState.data?.token ?? "");
      Prefs.setString(
          AppConstants.kUser, jsonEncode(dataState.data?.data?.toJson()));
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onLogin(LoginEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _loginUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(loginModel: dataState.data, isLoginVerified: true);
      Prefs.setString(AppConstants.kToken, dataState.data?.token ?? "");
      Prefs.setString(
          AppConstants.kUser, jsonEncode(dataState.data?.data?.toJson()));
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onRegister(RegisterEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _registerUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          registerModel: dataState.data, isRegisterVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onRecoverPassword(RecoverPasswordEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _recoverPasswordUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          recoverPasswordModel: dataState.data, isRecoverPasswordVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}

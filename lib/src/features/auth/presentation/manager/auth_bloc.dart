import 'dart:async';

import 'package:aloqa_nazorat/src/features/auth/data/bodies/login_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:bloc/bloc.dart';

import '../../../../core/resources/data_state.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;

  AuthBloc(
    this._loginUseCase,
  ) : super(AuthState()) {
    on<LoginEvent>((event, emit) async {
      await emit.onEach(_onLogin(event), onData: emit);
    });
  }

  login({required LoginBody body}) {
    add(LoginEvent(body: body));
  }

  Stream<AuthState> _onLogin(LoginEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _loginUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(loginModel: dataState.data, isLoginVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}

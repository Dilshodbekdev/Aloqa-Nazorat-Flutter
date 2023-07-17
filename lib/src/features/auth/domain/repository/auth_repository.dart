import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';

abstract class AuthRepository {
  Future<DataState<LoginModel>> login(LoginBody body);
}

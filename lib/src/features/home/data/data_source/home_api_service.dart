import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService{
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;
}
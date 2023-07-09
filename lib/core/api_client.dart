import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'model.dart';

part 'api_client.g.dart';

class Apis {
  static const String users = '/todos';
}
@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.users)
  Future<List<User>> getUsers();
}
import 'package:by_brand/data/api/rest_constants.dart';
import 'package:by_brand/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: RestConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET(RestConstants.users)
  Future<User> getUsers(
    @Queries() usersRequestParams,
    @Path() path,
    @Body() body,
  );
}

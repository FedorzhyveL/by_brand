import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:by_brand/data/api/response_models/base_dto.dart';
import 'package:by_brand/data/api/rest_constants.dart';
import 'package:by_brand/domain/models/user.dart';

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

  @GET(RestConstants.categories)
  Future<BaseDTOListData> getCategories(
    @Queries() Map<String, dynamic> queries,
  );
}

import 'package:by_brand/data/api/rest_client.dart';
import 'package:by_brand/domain/models/categorie.dart';
import 'package:by_brand/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final RestClient restClient;

  CategoriesRepositoryImpl({required this.restClient});
  @override
  Future<List<Categorie>> getCategories({int? page, int? size}) async {
    List<Categorie> categories = [];
    await restClient.getCategories(
      {
        'page': page,
        'size': size,
      },
    ).then(
      (value) => value.content?.forEach((element) {
        if (element != null) categories.add(Categorie.fromJson(element));
      }),
    );
    return categories;
  }
}

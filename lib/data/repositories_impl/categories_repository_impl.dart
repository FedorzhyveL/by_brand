import 'package:by_brand/data/api/rest_client.dart';
import 'package:by_brand/domain/models/product_categorie.dart';
import 'package:by_brand/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final RestClient restClient;

  CategoriesRepositoryImpl({required this.restClient});
  @override
  Future<List<ProductCategorie>> getCategories({int? page, int? size}) async {
    List<ProductCategorie> categories = [];
    await restClient.getCategories(
      {
        'page': page,
        'size': size,
      },
    ).then(
      (value) {
        value.data.content?.forEach((element) {
          if (element != null) categories.add(ProductCategorie.fromJson(element));
        });
      },
    );
    return categories;
  }
}

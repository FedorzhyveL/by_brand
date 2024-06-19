import 'package:by_brand/domain/models/product_categorie.dart';

abstract class CategoriesRepository {
  Future<List<ProductCategorie>> getCategories({int? page, int? size});
}

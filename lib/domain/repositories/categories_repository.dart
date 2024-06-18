import 'package:by_brand/domain/models/categorie.dart';

abstract class CategoriesRepository {
  Future<List<Categorie>> getCategories({int? page, int? size});
}

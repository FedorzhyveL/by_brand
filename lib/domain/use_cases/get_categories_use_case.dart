import 'package:by_brand/domain/models/categorie.dart';
import 'package:by_brand/domain/repositories/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository _categoriesRepository;

  GetCategoriesUseCase({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository;
  Future<List<Categorie>> call() async {
    return await _categoriesRepository.getCategories();
  }
}

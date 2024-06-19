import 'package:by_brand/domain/models/product_model.dart';
import 'package:by_brand/domain/repositories/products_repository.dart';

class GetProductsUseCase {
  final ProductsRepository _productsRepository;

  GetProductsUseCase({required ProductsRepository categoriesRepository}) : _productsRepository = categoriesRepository;
  Future<List<Product>> call() async {
    return await _productsRepository.getProducts(size: 100);
  }
}

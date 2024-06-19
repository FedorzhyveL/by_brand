import 'package:by_brand/domain/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts({int? page, int? size});
}

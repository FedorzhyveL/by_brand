import 'package:by_brand/data/api/rest_client.dart';
import 'package:by_brand/domain/models/product_model.dart';
import 'package:by_brand/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final RestClient restClient;

  ProductsRepositoryImpl({required this.restClient});
  @override
  Future<List<Product>> getProducts({int? page, int? size}) async {
    List<Product> products = [];
    await restClient.getProducts(
      {
        'page': page,
        'size': size,
      },
    ).then(
      (value) {
        value.data.content?.forEach((element) {
          if (element != null) products.add(Product.fromJson(element));
        });
      },
    );
    return products;
  }
}

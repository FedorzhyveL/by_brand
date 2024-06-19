part of 'cart_bloc.dart';

@freezed
sealed class CartEvent with _$CartEvent {
  const factory CartEvent.addProduct(final Product product) = _AddProduct;
  const factory CartEvent.removeProduct(final int id) = _RemoveProduct;
}

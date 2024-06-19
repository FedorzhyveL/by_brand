part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial({
    @Default([]) final List<Product> products,
  }) = _Initial;
}

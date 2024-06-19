import 'package:bloc/bloc.dart';
import 'package:by_brand/domain/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const _Initial()) {
    on<CartEvent>(
      (event, emit) => switch (event) {
        _AddProduct() => _addProduct(event, emit),
        _RemoveProduct() => _removeProduct(event, emit),
      },
    );
  }

  void _addProduct(_AddProduct event, Emitter<CartState> emit) {
    emit(
      state.copyWith(
        products: state.products.toList()..add(event.product),
      ),
    );
  }

  void _removeProduct(_RemoveProduct event, Emitter<CartState> emit) {
    emit(
      state.copyWith(
        products: state.products.toList()..removeAt(event.id),
      ),
    );
  }
}

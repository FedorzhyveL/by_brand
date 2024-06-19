import 'package:bloc/bloc.dart';
import 'package:by_brand/domain/models/product_model.dart';
import 'package:by_brand/domain/use_cases/get_products_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:by_brand/domain/models/product_categorie.dart';
import 'package:by_brand/domain/use_cases/get_categories_use_case.dart';

part 'main_bloc.freezed.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final FlutterSecureStorage _flutterSecureStorage;
  final GetCategoriesUseCase _getCategoriesUceCase;
  final GetProductsUseCase _getProductsUceCase;

  MainBloc(
    this._flutterSecureStorage,
    this._getCategoriesUceCase,
    this._getProductsUceCase,
  ) : super(MainState.initial()) {
    on<MainEvent>(
      (event, emit) async => switch (event) {
        _MainInitialEvent() => await _initialEvent(emit, event),
      },
    );
    add(MainEvent.initial());
  }

  Future<void> _initialEvent(Emitter<MainState> emit, _MainInitialEvent event) async {
    String? user = await _flutterSecureStorage.read(key: 'storred_user');
    List<ProductCategorie> categories = await _getCategoriesUceCase();
    List<Product> products = await _getProductsUceCase();
    await Future.wait(
      [
        _flutterSecureStorage.read(key: 'storred_user').then((value) => user = value),
        _getCategoriesUceCase().then((value) => categories = value),
        _getProductsUceCase().then((value) => products = value),
      ],
    );
    emit(
      MainState.loaded(
        user: user,
        categories: categories,
        products: products,
      ),
    );
  }
}

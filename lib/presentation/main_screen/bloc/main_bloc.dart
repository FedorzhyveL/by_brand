import 'package:bloc/bloc.dart';
import 'package:by_brand/domain/models/categorie.dart';
import 'package:by_brand/domain/use_cases/get_categories_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_bloc.freezed.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final FlutterSecureStorage _flutterSecureStorage;
  final GetCategoriesUseCase _getCategoriesUceCase;

  MainBloc(
    this._flutterSecureStorage,
    this._getCategoriesUceCase,
  ) : super(MainState.initial()) {
    on<MainEvent>(
      (event, emit) async => switch (event) {
        _MainInitialEvent() => await _initialEvent(emit, event),
      },
    );
    add(MainEvent.initial());
  }

  Future<void> _initialEvent(Emitter<MainState> emit, _MainInitialEvent event) async {
    final user = await _flutterSecureStorage.read(key: 'storred_user');
    final categories = await _getCategoriesUceCase();
    emit(
      MainState.loaded(
        user: user,
        categories: categories,
      ),
    );
  }
}

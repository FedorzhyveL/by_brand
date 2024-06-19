import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:by_brand/domain/models/product_categorie.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) => switch (event) {
          SelectCategorieHomeEvent() => _selectCategorie(emit, event),
        });
  }

  void _selectCategorie(Emitter<HomeState> emit, SelectCategorieHomeEvent event) {
    if (event.categorie.id != null) {
      final selectedIds = state.selectedCategoriesIds.toList();
      if (selectedIds.contains(event.categorie.id)) {
        selectedIds.remove(event.categorie.id);
      } else {
        selectedIds.add(event.categorie.id!);
      }
      emit(state.copyWith(selectedCategoriesIds: selectedIds));
    }
  }
}

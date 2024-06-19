part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const HomeState._();
  factory HomeState.initial({
    @Default([]) final List<int> selectedCategoriesIds,
  }) = _InitalHomeState;
}

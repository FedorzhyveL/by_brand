part of 'main_bloc.dart';

@freezed
sealed class MainState with _$MainState {
  const MainState._();
  factory MainState.initial() = _InitalMainState;

  factory MainState.loaded({final String? user}) = _LoadedMainState;
}

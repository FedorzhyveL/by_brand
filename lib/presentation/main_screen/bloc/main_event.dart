part of 'main_bloc.dart';

@freezed
sealed class MainEvent with _$MainEvent {
  const MainEvent._();

  factory MainEvent.initial() = _MainInitialEvent;
}

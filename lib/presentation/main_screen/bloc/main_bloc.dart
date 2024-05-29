import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_bloc.freezed.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final FlutterSecureStorage _flutterSecureStorage;

  MainBloc(this._flutterSecureStorage) : super(MainState.initial()) {
    on<MainEvent>(
      (event, emit) async => switch (event) {
        _MainInitialEvent() => await _initialEvent(emit, event),
      },
    );
  }

  Future<void> _initialEvent(Emitter<MainState> emit, _MainInitialEvent event) async {
    final user = await _flutterSecureStorage.read(key: 'storred_user');
    emit(MainState.loaded(user: user));
  }
}

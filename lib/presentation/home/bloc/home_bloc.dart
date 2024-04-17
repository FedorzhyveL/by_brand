import 'package:bloc/bloc.dart';
import 'package:by_brand/data/models/address.dart';
import 'package:by_brand/data/models/categorie.dart';
import 'package:by_brand/data/models/order.dart';
import 'package:by_brand/data/models/product.dart';
import 'package:by_brand/data/models/review.dart';
import 'package:by_brand/data/models/role.dart';
import 'package:by_brand/data/models/user.dart';
import 'package:by_brand/main.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final dio = injector.get<Dio>();
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) => switch (event) {
          ChangeDataBaseTable() => _chageDataTable(event, emit),
          DeleteDataEvent() => _deleteDataEvent(event, emit),
          EditDataEvent() => _editDataEvent(event, emit),
          AddDataToTableEvent() => _addDataEvent(event, emit),
        });
  }

  _chageDataTable(ChangeDataBaseTable event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));
    switch (event.table) {
      case DataBaseTables.addresses:
        emit(
          state.copyWith(
            addresses: await _get(path: 'addresses', fromJson: Address.fromJson),
            selectedTable: event.table,
            loading: false,
          ),
        );
      case DataBaseTables.users:
        emit(
          state.copyWith(
            users: await _get(path: 'users', fromJson: User.fromJson),
            selectedTable: event.table,
            loading: false,
          ),
        );
      case DataBaseTables.categories:
        emit(
          state.copyWith(
            categories: await _get(path: 'categories', fromJson: Categorie.fromJson),
            selectedTable: event.table,
            loading: false,
          ),
        );
      case DataBaseTables.orders:
        emit(
          state.copyWith(
            orders: await _get(path: 'orders', fromJson: Order.fromJson),
            selectedTable: event.table,
            loading: false,
          ),
        );
      case DataBaseTables.products:
        emit(
          state.copyWith(
            products: await _get(path: 'products', fromJson: Product.fromJson),
            selectedTable: event.table,
            loading: false,
          ),
        );
      case DataBaseTables.reviews:
        emit(
          state.copyWith(
            reviews: await _get(path: 'reviews', fromJson: Review.fromJson),
            selectedTable: event.table,
            loading: false,
          ),
        );
      case DataBaseTables.roles:
        emit(
          state.copyWith(
            roles: await _get(path: 'roles', fromJson: Role.fromJson),
            selectedTable: event.table,
            loading: false,
          ),
        );
      case DataBaseTables.choose:
        emit(state.copyWith(loading: false));
      case null:
        emit(state.copyWith(loading: false));
    }
  }

  Future<List<T>> _get<T>({required String path, required T Function(Map<String, dynamic>) fromJson}) async {
    return (((await dio.get('/$path')).data as Map<String, dynamic>)['data'] as List)
        .map(
          (e) => fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  Future<void> _add<T>({required String path, required Map<String, dynamic> data}) async {
    await dio.post('/$path', data: data);
  }

  Future<void> _delete<T>({required String path, required int? id}) async {
    await dio.delete('/$path/$id');
  }

  Future<void> _update<T>({required String path, required Map<String, dynamic>? data, required int? id}) async {
    await dio.put('/$path/$id', data: data);
  }

  _deleteDataEvent(DeleteDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));
    switch (event.table) {
      case DataBaseTables.addresses:
        await _delete(path: 'addresses', id: event.id);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.users:
        await _delete(path: 'users', id: event.id);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.categories:
        await _delete(path: 'categories', id: event.id);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.orders:
        await _delete(path: 'orders', id: event.id);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.products:
        await _delete(path: 'products', id: event.id);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.reviews:
        await _delete(path: 'reviews', id: event.id);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.roles:
        await _delete(path: 'roles', id: event.id);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.choose:
        emit(state.copyWith(loading: false));
      case null:
        emit(state.copyWith(loading: false));
    }
  }

  _editDataEvent(EditDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));
    switch (event.table) {
      case DataBaseTables.addresses:
        await _update(path: 'addresses', id: event.id, data: event.data);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.users:
        await _update(path: 'users', id: event.id, data: event.data);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.categories:
        await _update(path: 'categories', id: event.id, data: event.data);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.orders:
        await _update(path: 'orders', id: event.id, data: event.data);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.products:
        await _update(path: 'products', id: event.id, data: event.data);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.reviews:
        await _update(path: 'reviews', id: event.id, data: event.data);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.roles:
        await _update(path: 'roles', id: event.id, data: event.data);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.choose:
        emit(state.copyWith(loading: false));
      case null:
        emit(state.copyWith(loading: false));
    }
  }

  _addDataEvent(AddDataToTableEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));
    switch (state.selectedTable) {
      case DataBaseTables.addresses:
        await _add(path: 'addresses', data: event.data!);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.users:
        await _add(path: 'users', data: event.data!);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.categories:
        await _add(path: 'categories', data: event.data!);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.orders:
        await _add(path: 'orders', data: event.data!);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.products:
        await _add(path: 'products', data: event.data!);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.reviews:
        await _add(path: 'reviews', data: event.data!);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.roles:
        await _add(path: 'roles', data: event.data!);
        add(ChangeDataBaseTable(table: state.selectedTable));
      case DataBaseTables.choose:
        emit(state.copyWith(loading: false));
    }
  }
}

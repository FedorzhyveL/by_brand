part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeDataBaseTable extends HomeEvent {
  final DataBaseTables? table;

  ChangeDataBaseTable({required this.table});

  @override
  List<Object?> get props => [table];
}

class DeleteDataEvent extends HomeEvent {
  final int? id;
  final DataBaseTables? table;

  DeleteDataEvent({required this.id, required this.table});

  @override
  List<Object?> get props => [id, table];
}

class EditDataEvent extends HomeEvent {
  final int? id;
  final DataBaseTables? table;
  final Map<String, dynamic>? data;

  EditDataEvent({required this.data, required this.id, required this.table});

  @override
  List<Object?> get props => [id, table];
}

class AddDataToTableEvent extends HomeEvent {
  final Map<String, dynamic>? data;

  AddDataToTableEvent({required this.data});
  @override
  List<Object?> get props => [
        data,
      ];
}

part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectCategorieHomeEvent extends HomeEvent {
  final ProductCategorie categorie;

  SelectCategorieHomeEvent({required this.categorie});

  @override
  List<Object?> get props => [categorie];
}

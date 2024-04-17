part of 'home_bloc.dart';

enum DataBaseTables {
  choose,
  users,
  addresses,
  categories,
  orders,
  products,
  reviews,
  roles,
}

class HomeState extends Equatable {
  final List<User>? users;
  final List<Address>? addresses;
  final List<Categorie>? categories;
  final List<Order>? orders;
  final List<Product>? products;
  final List<Review>? reviews;
  final List<Role>? roles;
  final DataBaseTables selectedTable;
  final bool loading;

  const HomeState({
    this.users,
    this.addresses,
    this.categories,
    this.orders,
    this.products,
    this.reviews,
    this.roles,
    this.selectedTable = DataBaseTables.choose,
    this.loading = false,
  });

  HomeState copyWith({
    List<User>? users,
    List<Address>? addresses,
    List<Categorie>? categories,
    List<Order>? orders,
    List<Product>? products,
    List<Review>? reviews,
    List<Role>? roles,
    DataBaseTables? selectedTable,
    bool? loading,
  }) {
    return HomeState(
      users: users ?? this.users,
      addresses: addresses ?? this.addresses,
      categories: categories ?? this.categories,
      orders: orders ?? this.orders,
      products: products ?? this.products,
      reviews: reviews ?? this.reviews,
      roles: roles ?? this.roles,
      selectedTable: selectedTable ?? this.selectedTable,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        users,
        users,
        addresses,
        categories,
        orders,
        products,
        reviews,
        roles,
        selectedTable,
        loading,
      ];
}

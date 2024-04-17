import 'package:by_brand/presentation/home/bloc/home_bloc.dart';
import 'package:by_brand/presentation/widgets/cards/address_card.dart';
import 'package:by_brand/presentation/widgets/cards/categorie_card.dart';
import 'package:by_brand/presentation/widgets/cards/order_card.dart';
import 'package:by_brand/presentation/widgets/cards/product_card.dart';
import 'package:by_brand/presentation/widgets/cards/review_card.dart';
import 'package:by_brand/presentation/widgets/cards/role_card.dart';
import 'package:by_brand/presentation/widgets/cards/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _bloc;
  @override
  void initState() {
    _bloc = HomeBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Marketplace Data Base',
                textAlign: TextAlign.center,
              ),
              actions: [
                IconButton(
                    onPressed: (_bloc.state.loading || _bloc.state.selectedTable == DataBaseTables.choose)
                        ? null
                        : () => showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                padding: MediaQuery.of(context).viewInsets,
                                child: switch (state.selectedTable) {
                                  DataBaseTables.choose => const SizedBox(),
                                  DataBaseTables.users => UserCard(bloc: _bloc),
                                  DataBaseTables.addresses => AddressCard(bloc: _bloc),
                                  DataBaseTables.categories => CategorieCard(bloc: _bloc),
                                  DataBaseTables.orders => OrderCard(bloc: _bloc),
                                  DataBaseTables.products => ProductCard(bloc: _bloc),
                                  DataBaseTables.reviews => ReviewCard(bloc: _bloc),
                                  DataBaseTables.roles => RoleCard(bloc: _bloc),
                                },
                              ),
                            ),
                    icon: const Icon(
                      Icons.add_rounded,
                      color: Colors.green,
                      size: 40,
                    ))
              ],
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Выберите таблицу',
                    style: TextStyle(fontSize: 20),
                  ),
                  DropdownButton(
                    value: state.selectedTable,
                    hint: const Text('выберите таблицу'),
                    items: List.generate(
                      DataBaseTables.values.length,
                      (index) => DropdownMenuItem(
                        value: DataBaseTables.values[index],
                        child: Text(DataBaseTables.values[index].toString().split('.').last),
                      ),
                    ),
                    onChanged: _bloc.state.loading
                        ? null
                        : (DataBaseTables? newValue) => _bloc.add(
                              ChangeDataBaseTable(table: newValue),
                            ),
                  ),
                  _bloc.state.loading ? const CircularProgressIndicator() : Expanded(child: DataList(_bloc)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DataList extends StatelessWidget {
  const DataList(this.bloc, {super.key});
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    final state = bloc.state;
    List<dynamic>? items;
    switch (state.selectedTable) {
      case DataBaseTables.choose:
        items = List.empty();
      case DataBaseTables.users:
        items = state.users;
      case DataBaseTables.addresses:
        items = state.addresses;
      case DataBaseTables.categories:
        items = state.categories;
      case DataBaseTables.orders:
        items = state.orders;
      case DataBaseTables.products:
        items = state.products;
      case DataBaseTables.reviews:
        items = state.reviews;
      case DataBaseTables.roles:
        items = state.roles;
    }
    return ListView.separated(
      itemCount: items?.length ?? 0,
      itemBuilder: (context, index) => switch (state.selectedTable) {
        DataBaseTables.choose => const SizedBox(),
        DataBaseTables.users => UserCard(
            user: items?[index],
            bloc: bloc,
          ),
        DataBaseTables.addresses => AddressCard(
            address: items?[index],
            bloc: bloc,
          ),
        DataBaseTables.categories => CategorieCard(
            categorie: items?[index],
            bloc: bloc,
          ),
        DataBaseTables.orders => OrderCard(
            order: items?[index],
            bloc: bloc,
          ),
        DataBaseTables.products => ProductCard(
            product: items?[index],
            bloc: bloc,
          ),
        DataBaseTables.reviews => ReviewCard(
            review: items?[index],
            bloc: bloc,
          ),
        DataBaseTables.roles => RoleCard(
            role: items?[index],
            bloc: bloc,
          ),
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

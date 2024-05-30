import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:by_brand/presentation/home_page/bloc/home_bloc.dart';
import 'package:by_brand/presentation/widgets/cards/address_card.dart';
import 'package:by_brand/presentation/widgets/cards/categorie_card.dart';
import 'package:by_brand/presentation/widgets/cards/order_card.dart';
import 'package:by_brand/presentation/widgets/cards/product_card.dart';
import 'package:by_brand/presentation/widgets/cards/review_card.dart';
import 'package:by_brand/presentation/widgets/cards/role_card.dart';
import 'package:by_brand/presentation/widgets/cards/user_card.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _bloc;
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
          return const Scaffold(body: AutoRouter());
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

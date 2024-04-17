import 'package:auto_route/auto_route.dart';
import 'package:by_brand/presentation/home_page/bloc/home_bloc.dart';
import 'package:by_brand/presentation/widgets/cards/address_card.dart';
import 'package:by_brand/presentation/widgets/cards/categorie_card.dart';
import 'package:by_brand/presentation/widgets/cards/order_card.dart';
import 'package:by_brand/presentation/widgets/cards/product_card.dart';
import 'package:by_brand/presentation/widgets/cards/review_card.dart';
import 'package:by_brand/presentation/widgets/cards/role_card.dart';
import 'package:by_brand/presentation/widgets/cards/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _bloc;
  late final ScrollController _scrollController;
  @override
  void initState() {
    _bloc = HomeBloc();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: List.generate(
                    10,
                    (index) => Container(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: Image(
                              color: Colors.black,
                              image: NetworkImage(
                                'https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png',
                              ),
                            ),
                          ),
                          Text('price'),
                          Text('info 1'),
                          Text('info 2'),
                          Text('info 3'),
                        ],
                      ),
                    ),
                  ),
                ),
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

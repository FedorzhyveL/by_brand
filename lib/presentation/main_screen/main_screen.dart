import 'package:auto_route/auto_route.dart';
import 'package:by_brand/domain/use_cases/get_products_use_case.dart';
import 'package:by_brand/presentation/cart_page/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:by_brand/core/di.dart';
import 'package:by_brand/domain/use_cases/get_categories_use_case.dart';
import 'package:by_brand/presentation/main_screen/bloc/main_bloc.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = MainBloc(
      injector.get<FlutterSecureStorage>(),
      injector.get<GetCategoriesUseCase>(),
      injector.get<GetProductsUseCase>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => _bloc),
        BlocProvider(
          lazy: false,
          create: (context) => CartBloc(),
        )
      ],
      child: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          CartRoute(),
          ProfileRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => tabsRouter.setActiveIndex(index),
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: const Icon(Icons.shopping_cart_rounded),
                          ),
                          context.read<CartBloc>().state.map(
                                initial: (value) => value.products.isNotEmpty
                                    ? Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.purple[100],
                                          ),
                                          child: Center(
                                            child: Text(
                                              value.products.length.toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                        ],
                      );
                    },
                  ),
                  label: '',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.supervised_user_circle_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

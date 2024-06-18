import 'package:auto_route/auto_route.dart';
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          CartRoute(),
          ProfileRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Marketplace',
                textAlign: TextAlign.center,
              ),
            ),
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => tabsRouter.setActiveIndex(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  label: 'User',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

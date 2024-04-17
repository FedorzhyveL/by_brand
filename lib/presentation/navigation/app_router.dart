import 'package:auto_route/auto_route.dart';
import 'package:by_brand/presentation/home_page/home_page.dart';
import 'package:by_brand/presentation/main_screen/main_screen.dart';
import 'package:by_brand/presentation/profile_page/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
      ];
}

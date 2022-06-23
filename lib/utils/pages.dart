import 'package:get/route_manager.dart';
import 'package:the_movie_db/bindings/dashboard_bindings.dart';
import 'package:the_movie_db/bindings/login_bindings.dart';
import 'package:the_movie_db/bindings/splash_bindings.dart';
import 'package:the_movie_db/pages/dashboard.dart';
import 'package:the_movie_db/pages/login.dart';
import 'package:the_movie_db/pages/not_found.dart';
import 'package:the_movie_db/pages/splash.dart';

import 'routes.dart';

class AppPages {
  static GetPage get notFound => GetPage(
        name: Routes.notFound,
        page: () => const NotFoundPage(),
      );
  static List<GetPage> get pages => [
        GetPage(
          name: Routes.splash,
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Routes.login,
          page: () => LoginPage(),
          arguments: 0,
          binding: LoginBinding(),
        ),
        GetPage(
          name: Routes.dashboard,
          page: () => DashBoardPage(),
          arguments: 0,
          binding: DashboardBinding(),
        ),
      ];
}

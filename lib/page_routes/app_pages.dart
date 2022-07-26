import 'package:get/route_manager.dart';
import 'package:prod4_aval2_hang_game/pages/game_page/game_page.dart';
import 'package:prod4_aval2_hang_game/pages/main_page.dart';
import 'package:prod4_aval2_hang_game/pages/result_page/result_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.gamePage,
      page: () => GamePage(),
    ),
    GetPage(
      name: PagesRoutes.resultPage,
      page: () => const ResultPage(),
    ),
    GetPage(
      name: PagesRoutes.mainPage,
      page: () => HomePage(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String gamePage = '/game';
  static const String resultPage = '/result';
  static const String mainPage = '/main';
}

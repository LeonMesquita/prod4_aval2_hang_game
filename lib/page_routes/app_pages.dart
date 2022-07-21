import 'package:get/route_manager.dart';
import 'package:prod4_aval2_hang_game/pages/game_page/game_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.gamePage,
      page: () => GamePage(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String gamePage = '/game';
}

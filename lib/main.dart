import 'package:flutter/material.dart';
import 'package:prod4_aval2_hang_game/controllers/game_controller.dart';
import 'package:prod4_aval2_hang_game/page_routes/app_pages.dart';
import 'package:prod4_aval2_hang_game/pages/game_page/game_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:prod4_aval2_hang_game/pages/main_page.dart';
import 'package:prod4_aval2_hang_game/theme/theme.dart';

void main() {
  Get.lazyPut<GameController>(() => GameController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hang Game',
      debugShowCheckedModeBanner: false,
      theme: HangTheme.theme,
      home: HomePage(),
      initialRoute: PagesRoutes.mainPage,
      getPages: AppPages.pages,
    );
  }
}

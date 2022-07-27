import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prod4_aval2_hang_game/pages/game_page/widgets/start_button.dart';
import 'package:prod4_aval2_hang_game/theme/theme.dart';

import '../controllers/game_controller.dart';
import '../page_routes/app_pages.dart';
import 'game_page/widgets/logo.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
                title: 'Play',
                color: HangTheme.color,
                action: () {
                  gameController.startGame();
                  Get.offNamed(PagesRoutes.gamePage);
                }),
          ],
        ),
      ),
    );
  }
}

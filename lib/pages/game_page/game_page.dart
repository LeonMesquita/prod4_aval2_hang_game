import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:prod4_aval2_hang_game/controllers/game_controller.dart';
import 'package:prod4_aval2_hang_game/widgets/alphabet_buttons.dart';
import 'package:prod4_aval2_hang_game/widgets/dash.dart';

class GamePage extends StatelessWidget {
  GamePage({Key? key}) : super(key: key);

  final imagePath = 'assets/images/hang_images/forca1.png';
  int currentImage = 1;
  final gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    print('criou a tela!');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 45,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Obx(
                          () => Image.asset(gameController.imagePath.value),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Dashes(),
                  ],
                ),
              ),
              //
              //
              Expanded(
                flex: 55,
                child: Container(
                  // color: Colors.red.shade400,
                  child: Column(
                    children: [
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: AlphabetButtons(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

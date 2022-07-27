import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:prod4_aval2_hang_game/controllers/game_controller.dart';

import 'widgets/alphabet_buttons.dart';
import 'widgets/dash.dart';

class GamePage extends StatelessWidget {
  GamePage({Key? key}) : super(key: key);

  final imagePath = 'assets/images/hang_images/forca1.png';
  final gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
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
                    //
                    Dashes(),
                  ],
                ),
              ),
              //
              //
              Expanded(
                flex: 55,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Obx(
                          () => Text(
                            gameController.showHint.value
                                ? 'Dica: ${gameController.choosedHint.value}'
                                : '',
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Escolha uma letra',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: AlphabetButtons(),
                    ),
                    const Text('Dupla: Leonardo Mesquita e Arthur Mattei'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

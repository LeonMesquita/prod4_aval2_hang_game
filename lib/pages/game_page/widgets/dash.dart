import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controllers/game_controller.dart';

class Dashes extends StatelessWidget {
  Dashes({Key? key}) : super(key: key);

  final gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    final word = gameController.choosedWord.value;
    //
    //
    final dashesList = List<Widget>.generate(
      word.length,
      (index) => word[index] == ' '
          ? const SizedBox(width: 25)
          : Dashe(letter: word[index]),
    );
    return Center(
      child: Wrap(
        children: dashesList,
      ),
    );
  }
}

class Dashe extends StatelessWidget {
  final String letter;
  Dashe({Key? key, required this.letter}) : super(key: key);
  final gameController = Get.find<GameController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Obx(
            () => Text(
              gameController.playerGuess.value.contains(letter) ? letter : '',
              style: const TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          Container(
            width: 25,
            height: 3,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

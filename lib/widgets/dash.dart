import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/game_controller.dart';

class Dashes extends StatefulWidget {
  Dashes({Key? key}) : super(key: key);

  @override
  State<Dashes> createState() => _DashesState();
}

class _DashesState extends State<Dashes> {
  final gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    final word = gameController.choosedWord.value;
    final dashesList = List<Dashe>.generate(
      word.length,
      (index) => Dashe(letter: word[index]),
    );
    return Wrap(
      children: dashesList,
    );
  }
}

class Dashe extends StatelessWidget {
  String letter;
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
              style: TextStyle(fontSize: 30),
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

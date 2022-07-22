import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prod4_aval2_hang_game/controllers/game_controller.dart';

class AlphabetButtons extends StatelessWidget {
  AlphabetButtons({Key? key}) : super(key: key);
  // gerando lista do alfabeto

  @override
  Widget build(BuildContext context) {
    final gameController = Get.find<GameController>();
    var aCode = 'A'.codeUnitAt(0);
    var zCode = 'Z'.codeUnitAt(0);
    List<String> alphabets = List<String>.generate(
      zCode - aCode + 1,
      (index) => String.fromCharCode(aCode + index),
    );

    final buttons = List<AlphButton>.generate(
      alphabets.length,
      (index) => AlphButton(
        buttonText: alphabets[index],
        onpress: () {
          gameController.makeGuess(alphabets[index].toLowerCase());
        },
      ),
    );
    return Wrap(
      children: buttons,
    );
  }
}

class AlphButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onpress;
  const AlphButton({Key? key, required this.buttonText, required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: onpress,
          child: Text(
            buttonText,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

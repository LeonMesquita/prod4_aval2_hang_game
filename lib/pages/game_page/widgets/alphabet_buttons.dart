import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:prod4_aval2_hang_game/controllers/game_controller.dart';
import 'package:prod4_aval2_hang_game/controllers/player_controller.dart';
import 'package:prod4_aval2_hang_game/page_routes/app_pages.dart';

class AlphabetButtons extends StatelessWidget {
  const AlphabetButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameController = Get.find<GameController>();
    //
    // gerando lista do alfabeto
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

class AlphButton extends StatefulWidget {
  final String buttonText;
  final Function() onpress;

  const AlphButton({Key? key, required this.buttonText, required this.onpress})
      : super(key: key);

  @override
  State<AlphButton> createState() => _AlphButtonState();
}

class _AlphButtonState extends State<AlphButton> {
  bool isSelected = false;
  final gameController = Get.find<GameController>();
  final playerController = Get.find<PlayerController>();
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Fim do jogo'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.offNamed(PagesRoutes.resultPage);
            },
            child: const Text('Prosseguir para resultados'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Verifica se a palavra contém a letra deste botão
    //se tiver, ele fica verde
    final statusColor =
        gameController.isCorrect(widget.buttonText.toLowerCase())
            ? Colors.green
            : Colors.red;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: !isSelected ? Colors.blue : statusColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Obx(() => TextButton(
              onPressed: !isSelected && !gameController.isFinished()
                  ? () {
                      widget.onpress();
                      setState(() {
                        isSelected = true;
                      });

                      if (gameController.finishedGame.value) {
                        if (gameController.winner.value == 'player') {
                          playerController.definePlayerVictory();
                        } else {
                          playerController.defineMachineVictory();
                        }
                        _showDialog();
                      }
                    }
                  : () {
                      gameController.isFinished() ? _showDialog() : null;
                    },
              child: Text(
                widget.buttonText,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            )),
      ),
    );
  }
}

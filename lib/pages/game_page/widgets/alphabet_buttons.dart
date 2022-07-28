import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:prod4_aval2_hang_game/controllers/game_controller.dart';
import 'package:prod4_aval2_hang_game/controllers/player_controller.dart';
import 'package:prod4_aval2_hang_game/page_routes/app_pages.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
          showTopSnackBar(
            context,
            CustomSnackBar.info(
              message: gameController.isCorrect(alphabets[index].toLowerCase())
                  ? "Você acertou!"
                  : 'Você errou!',
              backgroundColor: Colors.black.withOpacity(0.8),
              icon: const SizedBox(),
            ),
            dismissType: DismissType.onSwipe,
            displayDuration: const Duration(seconds: 1),
            reverseAnimationDuration: const Duration(milliseconds: 500),
            animationDuration: const Duration(milliseconds: 500),
          );
          //  showSnackbar(context);
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
        actionsAlignment: MainAxisAlignment.center,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            'Fim do jogo!',
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                Get.offNamed(PagesRoutes.resultPage);
              },
              child: const Text(
                'Prosseguir para resultados',
                style: TextStyle(fontSize: 15),
              ),
            ),
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
            ? const Color.fromARGB(255, 15, 218, 21)
            : const Color.fromARGB(255, 245, 27, 11);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color:
              !isSelected ? const Color.fromARGB(255, 1, 55, 99) : statusColor,
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

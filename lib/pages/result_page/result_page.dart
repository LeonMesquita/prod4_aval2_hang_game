import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prod4_aval2_hang_game/controllers/game_controller.dart';
import 'package:prod4_aval2_hang_game/controllers/player_controller.dart';
import 'package:prod4_aval2_hang_game/page_routes/app_pages.dart';
import 'package:prod4_aval2_hang_game/theme/theme.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);
  final playerController = Get.find<PlayerController>();
  final gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    final winner =
        gameController.winner.value == 'player' ? 'Jogador' : 'Máquina';
    final correctPercent = gameController.calcCorrectPercent();
    final guesses = gameController.correctGuesses.value;
    final correctGuesses =
        guesses.isNotEmpty ? guesses.replaceAll('', ' ') : 'Nenhuma letra';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultados',
          style: TextStyle(color: HangTheme.color),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    resultText('Vencedor:  $winner'),
                    resultText('placar:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        placarContainer(resultText(
                            'Máquina: ${playerController.machine.value.totalWins}')),
                        placarContainer(resultText(
                            'Jogador: ${playerController.player.value.totalWins}')),
                      ],
                    ),
                    resultText(
                        'Palavra escolhida: ${gameController.choosedWord.value}'),
                    resultText('Dica: ${gameController.choosedHint.value}'),
                    resultText(
                        'Quantidade de chutes: ${gameController.playerGuess.value.length}'),
                    if (gameController.winner.value == 'machine')
                      resultText('Letras acertadas: ${correctGuesses}'),
                    if (gameController.winner.value == 'machine')
                      resultText(
                          'Porcentagem de acerto: ${correctPercent.toStringAsFixed(0)}%'),
                  ],
                ),
              )),
              ElevatedButton(
                onPressed: () {
                  gameController.reseteGame();
                  Get.offNamed(PagesRoutes.gamePage);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Reiniciar jogo',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

Widget resultText(text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      text,
      style: const TextStyle(fontSize: 24, color: HangTheme.color),
      textAlign: TextAlign.center,
    ),
  );
}

Widget placarContainer(child) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: HangTheme.color,
            width: 2,
          ),
        ),
        child: child,
      ),
    ),
  );
}

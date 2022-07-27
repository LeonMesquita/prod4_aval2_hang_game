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
    final winner = gameController.winner == 'player' ? 'Jogador' : 'Máquina';
    final correctPercent = gameController.calcCorrectPercent();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultados',
          style: TextStyle(color: HangTheme.color),
        ),
      ),
      //   backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            textoSupimpa('Vencedor: $winner'),
            textoSupimpa('placar:'),
            textoSupimpa(
                'Máquina: ${playerController.machine.value.totalWins}'),
            textoSupimpa('Jogador: ${playerController.player.value.totalWins}'),
            textoSupimpa(
                'Palavra escolhida: ${gameController.choosedWord.value}'),
            textoSupimpa('Dica: ${gameController.choosedHint.value}'),
            textoSupimpa(
                'Porcentagem de acerto: ${correctPercent.toStringAsFixed(0)}%'),
            ElevatedButton(
              onPressed: () {
                gameController.reseteGame();
                Get.offNamed(PagesRoutes.gamePage);
              },
              child: Text('Reiniciar jogo'),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget textoSupimpa(texto) {
  return Text(
    texto,
    style: const TextStyle(fontSize: 24, color: HangTheme.color),
  );
}

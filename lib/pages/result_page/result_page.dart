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
        title: const Text('Resultados'),
      ),
      //   backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Vencedor: $winner',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'placar:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Máquina: ${playerController.machine.value.totalWins}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Jogador: ${playerController.player.value.totalWins}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'estatísticas da partida:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Palavra escolhida: ${gameController.choosedWord.value}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Dica: ${gameController.choosedHint.value}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Porcentagem de acerto: ${correctPercent.toStringAsFixed(0)}%',
              style: TextStyle(fontSize: 24),
            ),
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

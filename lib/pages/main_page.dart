import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:prod4_aval2_hang_game/models/words_bank.dart';
import 'package:prod4_aval2_hang_game/pages/game_page/widgets/start_button.dart';
import 'package:prod4_aval2_hang_game/theme/theme.dart';

import '../controllers/game_controller.dart';
import '../page_routes/app_pages.dart';
import 'game_page/widgets/logo.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // instancia da lista de palavras
  final wordsList = WordsBank();

//
//instancia do controlador do jogo que foi salva na memória ao iniciar o app
//é atravez dela que vai ser definido a palavra e a dica
  final gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    /*
    Quando criar o botão para ir pro jogo, chama os seguintes métodos ao pressionar:
    final selectedWord = wordsList.chooseWord();
    vai sortear um item aleatorio da lista e retornar um objeto do tipo:
    Word(
      word: '',
      hint: '',
    ),


    depois chama o metodo do controlador:
    gameController.setWord(selectedWord.word, selectedWord.hint);

    pronto, ele já escolheu a palavra e a dica, pode levar pra tela do jogo
    para navegar pra tela do jogo basta usar:
    Get.offNamed(PagesRoutes.gamePage);
     */
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
                title: 'Play',
                color: Colors.white,
                action: () {
                  final selectedWord = wordsList.chooseWord();
                  gameController.setWord(selectedWord.word, selectedWord.hint);
                  Get.offNamed(PagesRoutes.gamePage);
                }),
            StartButton(title: 'Result', color: HangTheme.color, action: () {}),
          ],
        ),
      ),
    );
  }
}

import 'package:get/state_manager.dart';

import '../models/words_bank.dart';

const _basePath = 'assets/images/hang_images/';

class GameController extends GetxController {
  final wordsList = WordsBank();
  RxInt imageNumber = 1.obs;
  RxString imagePath = '${_basePath}forca1.png'.obs;
  RxString choosedWord = ''.obs;
  RxString choosedHint = ''.obs;
  RxString playerGuess = ''.obs;
  RxString correctGuesses = ''.obs;
  RxInt percentCorrect = 0.obs;
  RxBool showHint = false.obs;
  RxBool finishedGame = false.obs;
  RxString winner = ''.obs;

  void startGame() {
    final selectedWord = wordsList.chooseWord();
    choosedWord.value = selectedWord.word;
    choosedHint.value = selectedWord.hint;
  }

  bool isCorrect(guess) {
    if (!choosedWord.contains(guess)) {
      return false;
    }
    return true;
  }

  bool isFinished() {
    if (finishedGame.value) {
      return true;
    } else {
      return false;
    }
  }

  void makeGuess(guess) {
    if (!finishedGame.value) {
      playerGuess.value += guess;
      if (!isCorrect(guess)) {
        //
        if (finishedGame.value) {
          return;
        }
        //
        imageNumber.value++;
        imagePath.value = '${_basePath}forca$imageNumber.png';
        //
        if (imageNumber.value == 5) {
          showHint.value = true;
        }
        if (imageNumber.value == 7) {
          finishedGame.value = true;
          winner.value = 'machine';
          return;
        }
      } else {
        correctGuesses.value += guess;
        checkGameIsOver();
      }
    }
  }

  void checkGameIsOver() {
    final word = choosedWord.replaceAll(' ', '');
    bool isAllCorrect = true;
    word.split('').forEach((ch) => {
          if (!correctGuesses.contains(ch))
            {
              isAllCorrect = false,
            }
        });
    if (isAllCorrect) {
      finishedGame.value = true;
      winner.value = 'player';
    }
  }

  void reseteGame() {
    imageNumber.value = 1;
    imagePath.value = '${_basePath}forca1.png';
    choosedWord.value = '';
    choosedHint.value = '';
    playerGuess.value = '';
    correctGuesses.value = '';
    showHint.value = false;
    finishedGame.value = false;
    winner.value = '';

    //
    startGame();
  }

  double calcCorrectPercent() {
    int totalCorrects = 0;
    final word = choosedWord.replaceAll(' ', '');
    word.split('').forEach((ch) => {
          if (correctGuesses.contains(ch))
            {
              totalCorrects++,
            }
        });

    double totalPercent = (totalCorrects * 100) / word.length;
    return totalPercent;
  }
}

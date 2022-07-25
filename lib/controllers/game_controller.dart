import 'package:get/state_manager.dart';

const _basePath = 'assets/images/hang_images/';

class GameController extends GetxController {
  RxInt imageNumber = 1.obs;
  RxString imagePath = '${_basePath}forca1.png'.obs;
  RxString choosedWord = 'asiatica peituda'.obs;
  RxString choosedHint = 'sonho de todo otaku'.obs;
  RxString playerGuess = ''.obs;
  RxString correctGuesses = ''.obs;
  RxBool showHint = false.obs;
  RxBool finishedGame = false.obs;

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
    }
  }
}

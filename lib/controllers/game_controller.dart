import 'package:get/state_manager.dart';

const _basePath = 'assets/images/hang_images/';

class GameController extends GetxController {
  RxInt imageNumber = 1.obs;
  RxString imagePath = '${_basePath}forca1.png'.obs;
  RxString choosedWord = 'banana'.obs;
  RxString playerGuess = ''.obs;

  bool isCorrect(guess) {
    if (!choosedWord.contains(guess)) {
      return false;
    }
    return true;
  }

  void makeGuess(guess) {
    playerGuess.value += guess;
    if (!isCorrect(guess)) {
      if (imageNumber.value == 8) {
        return;
      }
      imageNumber.value++;
      imagePath.value = '${_basePath}forca$imageNumber.png';
    }
  }
}

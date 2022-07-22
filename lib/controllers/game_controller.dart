import 'package:get/state_manager.dart';

class GameController extends GetxController {
  RxInt imageNumber = 1.obs;
  RxString imagePath = 'assets/images/hang_images/forca1.png'.obs;
  RxString choosedWord = 'banana'.obs;
  RxString playerGuess = ''.obs;
  //RxBool isCorrect = false.obs;

  void changeImagePath() {
    if (imageNumber.value == 8) {
      return;
    }
    imageNumber.value++;
    imagePath.value = 'assets/images/hang_images/forca$imageNumber.png';
  }

  void makeGuess(guess) {
    playerGuess.value += guess;
    if (!choosedWord.contains(guess)) {
      changeImagePath();
      // isCorrect.value = false;
    } else {
      // isCorrect.value = true;
    }
  }

  bool isCorrect(guess) {
    if (!choosedWord.contains(guess)) {
      return false;
    }
    return true;
  }
}

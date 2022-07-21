import 'package:get/state_manager.dart';

class GameController extends GetxController {
  RxInt imageNumber = 1.obs;
  RxString imagePath = 'assets/images/hang_images/forca1.png'.obs;
  RxString choosedWord = 'banana'.obs;
  RxString playerGuess = ''.obs;

  void changeImagePath() {
    if (imageNumber.value == 8) {
      return;
    }
    imageNumber.value++;
    imagePath.value = 'assets/images/hang_images/forca$imageNumber.png';
  }

  void makeGuess(guess) {
    playerGuess.value += guess;
  }
}

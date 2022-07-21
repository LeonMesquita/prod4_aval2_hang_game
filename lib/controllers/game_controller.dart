import 'package:get/state_manager.dart';

class GameController extends GetxController {
  RxInt imageNumber = 1.obs;
  RxString imagePath = 'assets/images/hang_images/forca1.png'.obs;

  void changeImagePath() {
    imageNumber.value++;
    int number = imageNumber.value + 1;
    imagePath.value = 'assets/images/hang_images/forca${imageNumber}.png';
  }
}

import 'package:get/state_manager.dart';

import '../models/player_model.dart';

class PlayerController extends GetxController {
  Rx<Player> player = Player().obs;
  Rx<Player> machine = Player().obs;

  void definePlayerVictory() {
    player.value.incrementWins();
    player.refresh();
  }

  void defineMachineVictory() {
    machine.value.incrementWins();
    machine.refresh();
  }
}

class Player {
  int totalWins;
  int totalLooses;

  Player({this.totalWins = 0, this.totalLooses = 0});

  void incrementWins() {
    totalWins++;
  }

  void incrementLooses() {
    totalLooses++;
  }
}

import 'package:prod4_aval2_hang_game/models/word_model.dart';
import 'dart:math';

final random = new Random();

class WordsBank {
  final List<Word> words = [
    Word(
      word: 'banana',
      hint: 'é uma fruta',
    ),
    Word(
      word: 'mulher maravilha',
      hint: 'é uma super heroína',
    ),
    Word(
      word: 'linux',
      hint: 'o melhor SO',
    ),
    Word(
      word: 'senhor dos aneis',
      hint: 'um filme famoso',
    ),
    Word(
      word: 'iron maiden',
      hint: 'banda de heavy metal',
    ),
    Word(
      word: 'alan turing',
      hint: 'pai da computação',
    ),
  ];

  Word chooseWord() {
    final index = random.nextInt(words.length);
    return words[index];
  }
}

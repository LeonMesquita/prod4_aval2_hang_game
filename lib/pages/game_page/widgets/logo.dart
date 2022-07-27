import 'package:flutter/material.dart';
import 'package:prod4_aval2_hang_game/theme/theme.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);
  double _maxValue({required double value, required double max}) {
    if (value < max) {
      return value;
    } else
      return max;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset(
            'assets/images/forca(2).jfif',
            width: _maxValue(value: size.width * .6, max: 250),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: RichText(
            text: TextSpan(
                text: 'Hangman ',
                style:
                    DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
                children: const [
                  TextSpan(
                    text: 'Game',
                    style: TextStyle(color: HangTheme.color),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}

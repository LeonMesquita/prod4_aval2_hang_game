import 'package:flutter/material.dart';
import 'package:prod4_aval2_hang_game/theme/theme.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset(
            'lib/assets/forca(2).jfif',
            width: 80,
            height: 125,
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

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gyroball/screens/ballgame.dart';

void main() {
  runApp(
    GameWidget(
      backgroundBuilder: (context) {
        return Container(
          color: Colors.white,
        );
      },
      game: BallGame(),
    ),
  );
}

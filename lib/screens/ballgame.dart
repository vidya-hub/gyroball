import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:gyroball/components/gyroball.dart';

import '../components/rectcollider.dart';

class BallGame extends FlameGame with HasCollisionDetection {
  Paint ballColor = BasicPalette.black.paint();
  double ballSize = 20;
  late Vector2 screenSize;
  late CircleComponent gyroBall;
  late SpriteComponent rectCollider;
  @override
  Future<void> onLoad() async {
    setScreenSize();
    addBall();
    addBoxCollider();
    await super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  void setScreenSize() {
    screenSize = size;
  }

  void addBoxCollider() async {
    rectCollider = RectangleCollider()
      ..sprite = await loadSprite("collider.png")
      ..size = Vector2.all(100)
      ..position = Vector2(screenSize.x / 2.1, 200);
    add(rectCollider);
  }

  void addBall() {
    gyroBall = GyroBall(
      ballSize: ballSize,
      screenSize: screenSize,
    );
    add(gyroBall);
  }
}

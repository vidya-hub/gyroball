import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:gyroball/components/rectcollider.dart';
import 'package:gyroball/screens/ballgame.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroBall extends CircleComponent
    with CollisionCallbacks, HasGameRef<BallGame> {
  double ballSize;
  Vector2 screenSize;
  static Paint black = BasicPalette.black.paint();
  static bool collided = false;
  double sensorScale = 2;
  Vector2? sensorPosition;
  GyroBall({
    required this.ballSize,
    required this.screenSize,
  }) : super(
          radius: ballSize,
          position: Vector2(screenSize.x / 2, 50),
          paint: black,
          children: [CircleHitbox()],
        );

  @override
  void update(double dt) {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      sensorPosition = (Vector2(
        double.parse((event.y).toStringAsFixed(2)),
        double.parse((event.x).toStringAsFixed(2)),
      ));
    });
    print(sensorPosition);
    addGravity(sensorChanges: sensorPosition ?? Vector2.zero());
    super.update(dt);
  }

  void addGravity({required Vector2 sensorChanges}) {
    if ((position.y < screenSize.y - height - 5 && !collided)) {
      position.y += 5;
    }
    if (sensorChanges != Vector2.zero() && collided) {
      position.add(sensorChanges);
    }
  }

  @override
  Future<void> onLoad() {
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is RectangleCollider) {
      collided = true;
    }
    super.onCollision(intersectionPoints, other);
  }
}

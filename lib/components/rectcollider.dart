import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:gyroball/screens/ballgame.dart';

class RectangleCollider extends SpriteComponent
    with CollisionCallbacks, HasGameRef<BallGame> {
  RectangleCollider();

  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
  }
}

import 'package:particle_animation/particle_animation.dart';

final utils = Utils();

class Particles {
  late double radius;
  late Offset positon;
  final Color color;
  late double dx;
  late double dy;
  Particles(
    Size size,
    RadiusRange radiusRange,
    this.color,
  ) {
    radius = utils.random(radiusRange.min, radiusRange.max);
    double width = utils.random(0, size.width);
    double height = utils.random(0, size.height);
    dx = utils.random(-0.1, 0.1);
    dy = utils.random(-0.1, 0.1);
    positon = Offset(width, height);
  }
}

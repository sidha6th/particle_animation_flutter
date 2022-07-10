import 'package:particle_animation/particle_animation.dart';

class Utils {
  final range = Random();
  random(double min, double max) => range.nextDouble() * (max - min) + min;
}

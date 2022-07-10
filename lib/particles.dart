import 'package:particle_animation/particle_animation.dart';

class ParticleAnimation extends StatefulWidget {
  const ParticleAnimation({
    required this.playGroundSize,
    required this.child,
    required this.duration,
    required this.colors,
    this.particleCount = 100,
    this.radiusRange,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final Duration duration;
  final int particleCount;
  final Size playGroundSize;
  final RadiusRange? radiusRange;
  final List<Color> colors;
  @override
  State<ParticleAnimation> createState() => _ParticleAnimationState();
}

class _ParticleAnimationState extends State<ParticleAnimation> {
  final random = Random();
  late final List<Particles> particles;
  late final Timer timer;
  @override
  void initState() {
    super.initState();
    particles = List<Particles>.generate(
      100,
      (index) => Particles(
        widget.playGroundSize,
        widget.radiusRange ??
            RadiusRange(
              min: 3,
              max: 10,
            ),
        widget.colors[random.nextInt(
          widget.colors.length,
        )],
      ),
    );
    timer = Timer.periodic(
      widget.duration ~/ 60,
      (timer) {
        setState(() {});
        for (var particle in particles) {
          if (particle.positon.dx.abs() >= widget.playGroundSize.width + 5) {
            particle.positon = Offset(0, particle.positon.dy);
          } else if (particle.positon.dx.isNegative) {
            particle.positon =
                Offset(widget.playGroundSize.width + 3, particle.positon.dy);
          }
          if (particle.positon.dy.abs() >= widget.playGroundSize.height + 5) {
            particle.positon = Offset(particle.positon.dx, 0);
          } else if (particle.positon.dy.isNegative) {
            particle.positon =
                Offset(particle.positon.dx, widget.playGroundSize.height + 3);
          }
          particle.positon += Offset(particle.dx, particle.dy);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: CustomPaint(
          painter: Mypainter(particles),
          child: widget.child,
        ),
      );
}

//====================================================//
class Mypainter extends CustomPainter {
  final List<Particles> particles;
  Mypainter(this.particles);
  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      canvas.drawCircle(
        p.positon,
        p.radius,
        Paint()
          ..color = p.color
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

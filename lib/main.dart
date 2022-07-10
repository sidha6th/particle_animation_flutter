import 'package:particle_animation/particle_animation.dart';
import 'package:particle_animation/particles.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ParticleAnimation(
          playGroundSize: MediaQuery.of(context).size,
          duration: const Duration(microseconds: 800),
          colors: colorList,
          child: Container(),
        ),
      ),
    );
  }
}

List<Color> colorList = [
  Colors.green,
  Colors.yellow,
  Colors.black,
  Colors.blue,
  Colors.cyanAccent
];

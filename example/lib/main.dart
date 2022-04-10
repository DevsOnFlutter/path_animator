import 'package:flutter/material.dart';
import 'package:path_animator/path_animator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path Animator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Path Animator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller!.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomPaint(
        child: const SizedBox(width: 500, height: 500),
        painter: _MyCustomPainter(
          controller: _controller!,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller!.reset();
          _controller!.forward();
        },
        tooltip: 'Reset',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _MyCustomPainter extends CustomPainter {
  _MyCustomPainter({
    required this.controller,
  }) : super(repaint: controller);

  final AnimationController controller;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0.0, size.height * 0.25);
    path.lineTo(size.width * 0.25, size.height * 0.75);
    path.lineTo(size.width * 0.75, size.height * 0.75);
    path.lineTo(size.width, size.height * 0.25);
    path.close();

    // draw graph
    final path1 = Path();
    final animatedPath = PathAnimator.build(
      path: path,
      animationPercent: controller.value,
    );

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

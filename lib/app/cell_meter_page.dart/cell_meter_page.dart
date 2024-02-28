import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpinningContainer extends AnimatedWidget {
  final int r;
  final int g;
  final int b;
  final double a;
  final double startScale;
  const SpinningContainer(this.a, this.r, this.g, this.b, this.startScale, {
    super.key,
    required AnimationController controller,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    // var s = math.tan(_progress.value * math.pi / 2 + startScale);
    // s = s > 0 ? s : math.tan(_progress.value * math.pi / 2);
    var s = _progress.value + startScale >= 1 ? startScale + _progress.value - 1: _progress.value + startScale;
    return Transform.scale(
          // scale: _progress.value*startScale + 0.1,
          scale: s,
          child: Container(
            width: 400.0, 
            height: 400.0, 
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(((1-_progress.value) * 256 * a).round(), r, g, b)
            ),
          ),
    );
  }
}

class CellMeterPage extends StatefulWidget {
  const CellMeterPage({super.key});

  @override
  State<CellMeterPage> createState() => _CellMeterPageState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _CellMeterPageState extends State<CellMeterPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    upperBound: 0.9,
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  )..repeat();
  late Timer _timer;
  int c = 0;
  String t = 'Анализируем'; 
  

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1000), _updateState);
  }

  _updateState(){
    c += 1;
    t = c % 4 == 0 ? 'Анализируем' : c % 4 == 1 ? 'Анализируем.' : c % 4 == 2 ? 'Анализируем..' : 'Анализируем...';
    _timer = Timer(const Duration(seconds: 1), _updateState);
    setState(() {
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_control_rounded)
            )
          ],
      ),
      body:  
      Column(
        children: [
          Center(
            child: Stack(
              fit: StackFit.passthrough,
              clipBehavior: Clip.antiAlias,
              children: [
                SpinningContainer(0.2, 0, 148, 255, 0, controller: _controller,),
                SpinningContainer(0.2, 0, 148, 255, 0.2, controller: _controller,),
                SpinningContainer(0.2, 0, 148, 255, 0.4, controller: _controller),
                SpinningContainer(0.2, 0, 148, 255, 0.6, controller: _controller),
                // SpinningContainer(1, 0, 148, 255, 2.5, controller: _controller),
              ]
            )
          ),
          Text(
            t,
            textScaler: const TextScaler.linear(2),
          ),
          const Text(
            'Ищем ближайший сигнал, пожалуйста,\nне покидайте этот экран',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8D8D8D)
            ),

          )
        ]
      )
    );
  }
}

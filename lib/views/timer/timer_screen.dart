import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _counter = 0;
  Timer? _timer;
  bool _isRunning = false;
  bool _isPaused = false;

  void _startTimer() {
    _timer?.cancel();
    _counter = 0;
    _isRunning = true;
    _isPaused = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  void _pauseTimer() {
    if (_isRunning && !_isPaused) {
      _timer?.cancel();
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _resumeTimer() {
    if (_isPaused) {
      _isPaused = false;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _counter++;
        });
      });
    }
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _counter = 0;
      _isRunning = false;
      _isPaused = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Timer")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/reloj.jpg',
              height: 250,
            ),
            const SizedBox(height: 20),

            // Card del contador
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: [
                    const Icon(Icons.timer, size: 40, color: Colors.deepPurple),
                    const SizedBox(height: 10),
                    const Text("Segundos transcurridos",
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text(
                      "$_counter",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(thickness: 1),

            // Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _startTimer,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Iniciar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green),
                ),
                ElevatedButton.icon(
                  onPressed: _pauseTimer,
                  icon: const Icon(Icons.pause),
                  label: const Text("Pausar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange),
                ),
                ElevatedButton.icon(
                  onPressed: _resumeTimer,
                  icon: const Icon(Icons.play_circle_fill),
                  label: const Text("Reanudar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                ),
                ElevatedButton.icon(
                  onPressed: _resetTimer,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reiniciar"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Regresar al inicio"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 165, 60, 191),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
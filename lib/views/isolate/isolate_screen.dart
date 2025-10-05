import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  String _result = "Esperando...";
  bool _isRunning = false;

  // Simulación de una tarea pesada (ejemplo académico)
  static void heavyTask(SendPort sendPort) {
    int sum = 0;
    for (int i = 0; i < 500000000; i++) {
      sum += i;
    }
    sendPort.send(sum);
  }

  void _runIsolate() async {
    setState(() {
      _isRunning = true;
      _result = "Procesando información académica...";
    });

    final receivePort = ReceivePort();
    await Isolate.spawn(heavyTask, receivePort.sendPort);

    receivePort.listen((message) {
      setState(() {
        _isRunning = false;
        _result = "Análisis completado correctamente 🎓";
      });
      receivePort.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Análisis Académico - Isolate"),
        backgroundColor: const Color(0xFFA53CBF),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Encabezado
                Card(
                  color: const Color(0xFF1E1E1E),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Icon(Icons.analytics,
                            color: Color(0xFFA53CBF), size: 50),
                        const SizedBox(height: 10),
                        const Text(
                          "Análisis de Rendimiento Académico",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _result,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        _isRunning
                            ? const CircularProgressIndicator(
                                color: Color(0xFFA53CBF),
                              )
                            : ElevatedButton.icon(
                                onPressed: _runIsolate,
                                icon: const Icon(Icons.play_arrow),
                                label: const Text("Iniciar Análisis Pesado"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFFA53CBF), // Morado
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 15),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Mostrar tarjetas de resultados simulados si ya terminó
                if (!_isRunning && _result.contains("completado"))
                  Column(
                    children: [
                      const Text(
                        "📊 Resultados del Análisis",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 15,
                        runSpacing: 15,
                        children: const [
                          _ResultCard(
                              icon: Icons.school,
                              label: "Cursos Evaluados",
                              value: "12"),
                          _ResultCard(
                              icon: Icons.star,
                              label: "Promedio General",
                              value: "4.3"),
                          _ResultCard(
                              icon: Icons.access_time,
                              label: "Tiempo de Cálculo",
                              value: "2.1 s"),
                          _ResultCard(
                              icon: Icons.check_circle,
                              label: "Procesos Exitosos",
                              value: "100%"),
                        ],
                      ),
                    ],
                  ),

                const SizedBox(height: 40),

                // Botón para regresar
                ElevatedButton.icon(
                  onPressed: () {
                    context.go('/');
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Volver al Inicio"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA53CBF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget de tarjeta para resultados
class _ResultCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ResultCard(
      {required this.icon, required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFA53CBF), width: 1.2),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFA53CBF), size: 35),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
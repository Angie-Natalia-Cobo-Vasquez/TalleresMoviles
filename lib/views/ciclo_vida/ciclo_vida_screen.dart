import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CicloVidaScreen extends StatefulWidget {
  const CicloVidaScreen({super.key});

  @override
  State<CicloVidaScreen> createState() => CicloVidaScreenState();
}

class CicloVidaScreenState extends State<CicloVidaScreen> {
  int cantidad = 1;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print("🟢 initState() -> Pantalla de inscripción inicializada");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (kDebugMode) {
      print("🟡 didChangeDependencies() -> Dependencias cambiaron (ej: tema o idioma)");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("🔵 build() -> Construyendo pantalla de inscripción");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("📚 Inscripción Universitaria"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              "assets/images/libro.jpg",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),


            const Text(
              "Fundamentos de Programación",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              "Materias inscritas: $cantidad",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  cantidad++;
                  if (kDebugMode) {
                    print("🟠 setState() -> Inscribiste otra materia. Total: $cantidad");
                  }
                });
              },
              child: const Text("Inscribir otra materia"),
            ),
            const SizedBox(height: 20),


            ElevatedButton.icon(
              onPressed: () {
                if (kDebugMode) {
                  print("⬅️ Volviendo al home");
                }
                context.go('/');
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Volver al Home"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print("🔴 dispose() -> Pantalla de inscripción destruida");
    }
    super.dispose();
  }
}
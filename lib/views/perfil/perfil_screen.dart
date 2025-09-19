import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talleresmoviles/widgets/custom_drawer.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    super.dispose();
  }

  void goToDetalle(String metodo) {
    final nombre = nombreController.text.trim();
    final correo = correoController.text.trim();

    if (nombre.isEmpty || correo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completa los datos')),
      );
      return;
    }

    final nombreEnc = Uri.encodeComponent(nombre);
    final correoEnc = Uri.encodeComponent(correo);

    if (kDebugMode) {
      print('Navegando con método: $metodo (nombre: $nombre, correo: $correo)');
    }

    switch (metodo) {
      case 'go':
        context.go('/perfil-detalle/$nombreEnc/$correoEnc/$metodo');
        break;
      case 'push':
        context.push('/perfil-detalle/$nombreEnc/$correoEnc/$metodo');
        break;
      case 'replace':
        context.replace('/perfil-detalle/$nombreEnc/$correoEnc/$metodo');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil Académico')),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text(
              "Datos del estudiante",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre completo',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: correoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo institucional',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => goToDetalle('go'),
                  child: const Text("Ir con Go"),
                ),
                ElevatedButton(
                  onPressed: () => goToDetalle('push'),
                  child: const Text("Ir con Push"),
                ),
                ElevatedButton(
                  onPressed: () => goToDetalle('replace'),
                  child: const Text("Ir con Replace"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Prueba diferentes métodos de navegación para ver cómo cambia el historial.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

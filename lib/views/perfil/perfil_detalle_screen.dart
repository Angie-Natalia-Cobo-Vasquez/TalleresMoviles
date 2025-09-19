import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PerfilDetalleScreen extends StatelessWidget {
  final String nombre;
  final String correo;
  final String metodo;

  const PerfilDetalleScreen({
    super.key,
    required this.nombre,
    required this.correo,
    required this.metodo,
  });

  void volverInteligente(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      context.pop();
    } else {
      context.go('/perfil');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle del Estudiante"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => volverInteligente(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Información Académica",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("Nombre: $nombre", style: const TextStyle(fontSize: 18)),
            Text("Correo institucional: $correo", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text("Método de navegación: $metodo",
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => volverInteligente(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Volver"),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.home),
              label: const Text("Inicio"),
            ),
          ],
        ),
      ),
    );
  }
}
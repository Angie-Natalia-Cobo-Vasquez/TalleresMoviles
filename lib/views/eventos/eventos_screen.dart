import 'package:flutter/material.dart';
import '../../widgets/custom_drawer.dart';

class EventosScreen extends StatelessWidget {
  const EventosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventos - UCEVA')),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Semana Bienestar Universitario 2025', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Festival literario - Tejiendo letras', style: TextStyle(color: Colors.grey)),
            Text('Torneo Voleibol', style: TextStyle(color: Colors.grey)),
            Text('Final futbolito', style: TextStyle(color: Colors.grey)),
            Text('Apertura semana bienestar', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

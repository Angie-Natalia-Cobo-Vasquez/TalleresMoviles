import 'package:flutter/material.dart';
import '../../widgets/custom_drawer.dart';

class CursosScreen extends StatelessWidget {
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cursos - UCEVA')),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Cursos gratuitos administrativos y contables', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Curso Básico en Contabilidad y Finanzas – Duración 24 Horas', style: TextStyle(color: Colors.grey)),
            Text('Seminario Atención al Cliente y Mercadeo – Duración 8 Horas', style: TextStyle(color: Colors.grey)),
            Text('Liderazgo y Políticas Públicas – Duración 16 Horas', style: TextStyle(color: Colors.grey)),
            Text('Curso Básico en Administración – Duración 24 Horas', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

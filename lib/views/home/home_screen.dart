import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo Universitario'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '🎓 Bienvenido al Catálogo Universitario 🎓\n'
              'Explora las materias y cursos disponibles para este semestre.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 164, 31, 185),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Image.asset(
              "assets/images/universidad.jpg",
              height: 150,
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              icon: const Icon(Icons.menu_book),
              label: const Text("Ir al Catálogo de Materias"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () {

                context.go('/catalogo?promo=Bienvenido');
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Ir al Catálogo con push()"),
              onPressed: () {
                context.push('/catalogo?promo=ConPush');
              },
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              child: const Text("Ir al Catálogo con replace()"),
              onPressed: () {
                context.replace('/catalogo?promo=ConReplace');
              },
            ),

            const SizedBox(height: 40),

            // 👇 Nueva sección: muestra la versión actual con ícono
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'Versión 1.0.1',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
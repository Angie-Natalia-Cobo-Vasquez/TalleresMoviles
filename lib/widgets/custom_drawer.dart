import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Text(
              'Catálogo Universitario',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // INICIO
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              context.go('/');
              Navigator.pop(context);
            },
          ),

          // CATALOGO
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('Catálogo Académico'),
            onTap: () {
              context.goNamed('catalogo');
              Navigator.pop(context);
            },
          ),

          // CURSOS
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Cursos'),
            onTap: () {
              context.go('/cursos');
              Navigator.pop(context);
            },
          ),

          // EVENTOS
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Eventos'),
            onTap: () {
              context.go('/eventos');
              Navigator.pop(context);
            },
          ),

          // PERFIL
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              context.go('/perfil');
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.loop),
            title: const Text('Ciclo de Vida'),
            onTap: () {
              context.go('/ciclo_vida');
              Navigator.pop(context);
            },
          ),

          // FUTURE / ASYNC AWAIT
          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text('Future / Async Await'),
            onTap: () {
              context.go('/future');
              Navigator.pop(context);
            },
          ),

          // TIMER
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Timer'),
            onTap: () {
              context.go('/timer');
              Navigator.pop(context);
            },
          ),

          // ISOLATE
          ListTile(
            leading: const Icon(Icons.memory),
            title: const Text('Isolate'),
            onTap: () {
              context.go('/isolate');
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text('Consumo de API (HTTP)'),
            onTap: () {
              context.go('/cat');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

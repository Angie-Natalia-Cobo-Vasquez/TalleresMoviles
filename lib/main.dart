import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talleresmoviles/firebase_options.dart';
import 'package:talleresmoviles/routes/app_router.dart';
import 'package:talleresmoviles/themes/app_theme.dart';
import 'package:talleresmoviles/providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Si en el futuro necesitas SharedPreferences al inicio, inicialízalas aquí.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      // Se crea el provider aquí para que todo el árbol (incluido GoRouter/MaterialApp.router)
      // pueda acceder a AuthProvider.
      create: (_) {
        final p = AuthProvider();
        // lanzar la verificación inicial (no se espera)
        p.checkLogin();
        return p;
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        title: 'Catálogo Universitario - Angie Cobo (230222011)',
        routerConfig: appRouter,
      ),
    );
  }
}


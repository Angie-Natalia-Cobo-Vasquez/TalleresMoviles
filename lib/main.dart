import 'package:flutter/material.dart';
import 'package:talleresmoviles/routes/app_router.dart';
import 'themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talleresmoviles/views/cat/cat_list_screen.dart';
import 'package:talleresmoviles/views/cat/cat_detail_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      title: 'Catálogo Universitario - Angie Cobo (230222011)',
      routerConfig: appRouter,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talleresmoviles/models/cat_item_model.dart';
import 'package:talleresmoviles/screens/evidence_screen.dart';
import 'package:talleresmoviles/screens/login_screen.dart';
import 'package:talleresmoviles/screens/register_screen.dart';
import 'package:talleresmoviles/views/catalogo/catalogo_screen.dart';
import 'package:talleresmoviles/views/categoria_fb/categoria_fb_form_view.dart';
import 'package:talleresmoviles/views/categoria_fb/categoria_fb_list_view.dart';
import 'package:talleresmoviles/views/ciclo_vida/ciclo_vida_screen.dart';
import 'package:talleresmoviles/views/perfil/perfil_screen.dart';
import 'package:talleresmoviles/views/perfil/perfil_detalle_screen.dart';
import 'package:talleresmoviles/views/universidades_fb/universidades_fb_form_view.dart';
import 'package:talleresmoviles/views/universidades_fb/universidades_fb_list_view.dart';
import '../views/home/home_screen.dart';
import 'package:talleresmoviles/views/cursos/cursos_screen.dart';
import 'package:talleresmoviles/views/eventos/eventos_screen.dart';
import 'package:talleresmoviles/views/future/future_screen.dart';
import 'package:talleresmoviles/views/timer/timer_screen.dart';
import 'package:talleresmoviles/views/isolate/isolate_screen.dart';
import 'package:talleresmoviles/views/cat/cat_list_screen.dart';
import 'package:talleresmoviles/views/cat/cat_detail_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    // Home
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),

    // Login
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),

    // Register
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),

    // Evidence
    GoRoute(
      path: '/evidence',
      name: 'evidence',
      builder: (context, state) => const EvidenceScreen(),
    ),

    // Perfil principal
    GoRoute(
      path: '/perfil',
      name: 'perfil',
      builder: (context, state) => const PerfilScreen(),
    ),

    // Perfil Detalle con parámetros
    GoRoute(
      path: '/perfil-detalle/:nombre/:correo/:metodo',
      name: 'perfilDetalle',
      builder: (context, state) {
        final nombre = state.pathParameters['nombre']!;
        final correo = state.pathParameters['correo']!;
        final metodo = state.pathParameters['metodo']!;
        return PerfilDetalleScreen(
          nombre: nombre,
          correo: correo,
          metodo: metodo,
        );
      },
    ),

    // Catálogo
    GoRoute(
      path: '/catalogo',
      name: 'catalogo',
      builder: (context, state) => const CatalogoScreen(),
    ),

    // Cursos
    GoRoute(
      path: '/cursos',
      name: 'cursos',
      builder: (context, state) => const CursosScreen(),
    ),

    // Eventos
    GoRoute(
      path: '/eventos',
      name: 'eventos',
      builder: (context, state) => const EventosScreen(),
    ),

    // Ciclo de vida
    GoRoute(
      path: '/ciclo-vida',
      name: 'cicloVida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
    GoRoute(path: '/ciclo_vida', redirect: (context, state) => '/ciclo-vida'),

    // Future Demo
    GoRoute(
      path: '/future',
      name: 'future',
      builder: (context, state) => const FutureScreen(),
    ),

    // Timer Demo
    GoRoute(
      path: '/timer',
      name: 'timer',
      builder: (context, state) => const TimerScreen(),
    ),

    // Isolate Demo
    GoRoute(
      path: '/isolate',
      name: 'isolate',
      builder: (context, state) => const IsolateScreen(),
    ),

    // Razas de gatos (API HTTP)
    GoRoute(
      path: '/cat',
      name: 'catList',
      builder: (context, state) => const CatListScreen(),
    ),
    GoRoute(
      path: '/cat/detail',
      name: 'catDetail',
      builder: (context, state) {
        final extra = state.extra;
        if (extra is CatItem) {
          return CatDetailScreen(cat: extra);
        }
        return const Scaffold(
          body: Center(child: Text('No se pudo cargar el detalle del gato')),
        );
      },
    ),

    // Rutas para el manejo de Categorías (CRUD)
    GoRoute(
      path: '/categoriasFirebase',
      name: 'categoriasFirebase',
      builder: (_, __) => const CategoriaFbListView(),
    ),
    GoRoute(
      path: '/categoriasfb/create',
      name: 'categoriasfb.create',
      builder: (context, state) => const CategoriaFbFormView(),
    ),
    GoRoute(
      path: '/categoriasfb/edit/:id',
      name: 'categorias.edit',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CategoriaFbFormView(id: id);
      },
    ),

        // Rutas para el manejo de Universidades (CRUD)
    GoRoute(
      path: '/universidadesFirebase',
      name: 'universidadesFirebase',
      builder: (_, __) => const UniversidadesFbListView(),
    ),
    GoRoute(
      path: '/universidadesfb/create',
      name: 'universidadesfb.create',
      builder: (context, state) => const UniversidadesFbFormView(),
    ),
    GoRoute(
      path: '/universidadesfb/edit/:id',
      name: 'universidades.edit',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return UniversidadesFbFormView(id: id);
      },
    ),
  ],
);

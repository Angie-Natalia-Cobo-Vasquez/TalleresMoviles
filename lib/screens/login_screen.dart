import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>(); // escucha cambios

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            auth.loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      await auth.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );

                      if (auth.loggedIn) {
                        if (mounted) {
                          // ✅ Navegación segura post-frame
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            context.go('/evidence');
                          });
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Credenciales incorrectas'),
                          ),
                        );
                      }
                    },
                    child: const Text('Iniciar sesión'),
                  ),
          ],
        ),
      ),
    );
  }
}

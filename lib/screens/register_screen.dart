import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthProvider>(); // no escucha cambios

    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration:
                  const InputDecoration(labelText: 'Confirmar contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                final confirmPassword = confirmPasswordController.text.trim();

                if (name.isEmpty ||
                    email.isEmpty ||
                    password.isEmpty ||
                    confirmPassword.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Todos los campos son obligatorios')),
                  );
                  return;
                }

                if (password != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Las contraseñas no coinciden')),
                  );
                  return;
                }

                // Registro simulado
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registro exitoso (simulado)')),
                );

                if (mounted) {
                  // ✅ Navegación segura post-frame
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.go('/login');
                  });
                }
              },
              child: const Text('Registrarse'),
            ),
            const SizedBox(height: 20),
            // ✅ Botón para volver al Home
            ElevatedButton.icon(
              onPressed: () {
                if (kDebugMode) {
                  print("⬅️ Volviendo al home");
                }
                context.go('/');
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Volver al Home"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 165, 60, 191),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

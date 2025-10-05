import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  late Future<List<Map<String, String>>> _futureCarreras;

  @override
  void initState() {
    super.initState();
    print("🔹 Antes de cargar los datos (initState)");
    _futureCarreras = cargarCarreras();
  }

  // Simula una petición a un servidor con async/await
  Future<List<Map<String, String>>> cargarCarreras() async {
    try {
      print("⏳ Iniciando carga de datos (dentro del Future)...");
      await Future.delayed(const Duration(seconds: 3)); // espera simulada
      print("✅ Datos cargados correctamente (después del await)");

      // Lista de carreras simulada
      return [
        {
          "nombre": "Programación Móvil",
          "imagen": "https://cdn-icons-png.flaticon.com/512/888/888859.png"
        },
        {
          "nombre": "Bases de Datos",
          "imagen": "https://cdn-icons-png.flaticon.com/512/4248/4248443.png"
        },
        {
          "nombre": "Inteligencia Artificial",
          "imagen": "https://cdn-icons-png.flaticon.com/512/4712/4712100.png"
        },
        {
          "nombre": "Redes de Computadores",
          "imagen": "https://cdn-icons-png.flaticon.com/512/841/841364.png"
        },
        {
          "nombre": "Seguridad Informática",
          "imagen": "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
        },
        {
          "nombre": "Computación en la Nube",
          "imagen": "https://cdn-icons-png.flaticon.com/512/4144/4144784.png"
        },
        {
          "nombre": "Arquitectura de Computadores",
          "imagen": "https://cdn-icons-png.flaticon.com/512/2721/2721299.png"
        },
      ];
    } catch (e) {
      print("❌ Ocurrió un error al cargar los datos: $e");
      throw Exception("Error al cargar los datos");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("🎨 Construyendo la interfaz...");
    return Scaffold(
      appBar: AppBar(title: const Text("Future - async/await")),
      body: Center(
        child: FutureBuilder<List<Map<String, String>>>(
          future: _futureCarreras,
          builder: (context, snapshot) {
            // Estado: esperando el resultado
            if (snapshot.connectionState == ConnectionState.waiting) {
              print("⌛ Estado: Cargando...");
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text("Cargando carreras..."),
                ],
              );
            }

            // Estado: error
            else if (snapshot.hasError) {
              print("❗ Estado: Error detectado");
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ocurrió un error: ${snapshot.error}"),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.go('/');
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Volver al Home"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 165, 60, 191),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              );
            }

            // Estado: éxito
            else if (snapshot.hasData) {
              print("✅ Estado: Éxito — datos disponibles");
              final carreras = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: carreras.length,
                      itemBuilder: (context, index) {
                        final carrera = carreras[index];
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Image.network(
                              carrera["imagen"]!,
                              width: 50,
                              height: 50,
                            ),
                            title: Text(
                              carrera["nombre"]!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle:
                                const Text("Disponible este semestre"),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.go('/');
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Volver al Home"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 165, 60, 191),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }

            // Estado: sin datos
            else {
              print("⚠️ Estado: Sin datos");
              return const Text("No hay datos disponibles");
            }
          },
        ),
      ),
    );
  }
}
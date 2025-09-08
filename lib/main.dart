import 'package:flutter/material.dart';

void main() {
  runApp(const TallerApp());
}

class TallerApp extends StatelessWidget {
  const TallerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titulo = "Hola, Flutter";

  void cambiarTitulo() {
    setState(() {
      titulo = titulo == "Hola, Flutter" ? "¡Título cambiado!" : "Hola, Flutter";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Título actualizado")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 58, 183, 173),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              "Angie Natalia Cobo Vásquez",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png",
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: 16),
                Image.asset(
                  "assets/images/flutter_logo.png",
                  width: 80,
                  height: 80,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: cambiarTitulo,
              child: const Text("Cambiar título"),
            ),
            const SizedBox(height: 16),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ListTile(
                  leading: Icon(Icons.star, color: Colors.amber),
                  title: Text("Icono 1"),
                ),
                ListTile(
                  leading: Icon(Icons.phone_android, color: Colors.blue),
                  title: Text("Icono 2"),
                ),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.red),
                  title: Text("Icono 3"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: [
                Container(
                  margin: const EdgeInsets.all(6),
                  color: const Color.fromARGB(255, 20, 242, 220),
                  child: const Center(child: Text("Celda 1", style: TextStyle(color: Colors.white))),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  color: const Color.fromARGB(255, 0, 255, 247),
                  child: const Center(child: Text("Celda 2", style: TextStyle(color: Colors.white))),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  color: const Color.fromARGB(255, 0, 255, 247),
                  child: const Center(child: Text("Celda 3", style: TextStyle(color: Colors.white))),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  color: const Color.fromARGB(255, 20, 242, 220),
                  child: const Center(child: Text("Celda 4", style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

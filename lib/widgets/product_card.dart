import 'package:flutter/material.dart';

class CatalogCard extends StatelessWidget {
  final String titulo;
  final String imagen;
  final VoidCallback onTap;

  const CatalogCard({
    super.key,
    required this.titulo,
    required this.imagen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagen,
              width: 90,
              height: 90,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: onTap,
              child: const Text("Detalles"),
            ),
          ],
        ),
      ),
    );
  }
}

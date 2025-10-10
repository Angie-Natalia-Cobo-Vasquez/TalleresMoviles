// lib/views/cat/cat_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:talleresmoviles/models/cat_item_model.dart';

class CatDetailScreen extends StatelessWidget {
  final CatItem cat;
  const CatDetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle gato')),
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: cat.id,
              child: InteractiveViewer(
                child: Image.network(
                  cat.imageUrl,
                  fit: BoxFit.contain,
                  loadingBuilder: (c, child, progress) {
                    if (progress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (c, e, s) => const Center(child: Icon(Icons.broken_image, size: 64)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver'),
            ),
          )
        ],
      ),
    );
  }
}

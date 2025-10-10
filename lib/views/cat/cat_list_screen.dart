// lib/views/cat/cat_list_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talleresmoviles/services/cat_service.dart';
import 'package:talleresmoviles/models/cat_item_model.dart';

class CatListScreen extends StatefulWidget {
  const CatListScreen({super.key});
  @override
  State<CatListScreen> createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  final CatService _service = CatService();
  late Future<List<CatItem>> _futureCats;

  @override
  void initState() {
    super.initState();
    debugPrint("🐱 INIT: CatListScreen iniciado");
    _futureCats = _service.fetchCatImages(limit: 30);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gatos')),
      body: FutureBuilder<List<CatItem>>(
        future: _futureCats,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final cats = snapshot.data ?? [];
          if (cats.isEmpty) return const Center(child: Text('No hay imágenes'));

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.0, crossAxisSpacing: 8, mainAxisSpacing: 8
            ),
            itemCount: cats.length,
            itemBuilder: (context, index) {
              final item = cats[index];
              return GestureDetector(
                onTap: () {
                  // pasar url al detalle con go_router o Navigator
                  context.go('/cat/detail', extra: item);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GridTile(
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(child: Icon(Icons.broken_image)),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


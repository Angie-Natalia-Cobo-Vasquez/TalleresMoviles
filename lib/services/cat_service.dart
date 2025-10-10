import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:talleresmoviles/models/cat_item_model.dart';

class CatService {
  static const String _baseUrl = 'https://api.thecatapi.com/v1';

  /// Obtiene imágenes de gatos junto con sus datos de raza.
  Future<List<CatItem>> fetchCatImages({int limit = 20}) async {
    final uri = Uri.parse('$_baseUrl/images/search?limit=$limit');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      // Mapeo cada elemento a CatItem
      return data.map((e) {
        final breeds = e['breeds'] as List?;
        final breed = breeds != null && breeds.isNotEmpty ? breeds.first : null;

        return CatItem(
          id: e['id'] ?? '',
          name: breed?['name'] ?? 'Desconocido',
          origin: breed?['origin'] ?? 'N/A',
          temperament: breed?['temperament'] ?? '',
          description: breed?['description'] ?? '',
          imageUrl: e['url'] ?? '',
        );
      }).toList();
    } else {
      throw Exception('Error al cargar imágenes: ${response.statusCode}');
    }
  }
}


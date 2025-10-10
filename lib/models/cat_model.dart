// lib/models/cat_model.dart
class CatBreed {
  final String id;
  final String name;
  final String origin;
  final String description;
  final String temperament;
  final String? imageUrl;

  CatBreed({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.temperament,
    this.imageUrl,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Desconocido',
      origin: json['origin'] ?? 'No especificado',
      description: json['description'] ?? 'Sin descripción',
      temperament: json['temperament'] ?? 'Desconocido',
      imageUrl: json['image'] != null ? json['image']['url'] : null,
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/universidades_fb.dart';

class UniversidadesService {
  static final _ref = FirebaseFirestore.instance.collection('universidades');

  /// Obtiene todas las universidades
  static Future<List<UniversidadesFb>> getUniversidades() async {
    final snapshot = await _ref.get();
    return snapshot.docs
        .map((doc) => UniversidadesFb.fromMap(doc.id, doc.data()))
        .toList();
  }

  /// Agrega una nueva universidad
  static Future<void> addUniversidades(UniversidadesFb universidad) async {
    await _ref.add(universidad.toMap());
  }

  /// Actualiza una universidad existente
  static Future<void> updateUniversidades(UniversidadesFb universidad) async {
    await _ref.doc(universidad.id).update(universidad.toMap());
  }

  /// Obtiene una universidad por su ID
  static Future<UniversidadesFb?> getUniversidadesById(String id) async {
    final doc = await _ref.doc(id).get();
    if (doc.exists) {
      return UniversidadesFb.fromMap(doc.id, doc.data()!);
    }
    return null;
  }

  /// Stream para observar una universidad específica por ID
  static Stream<UniversidadesFb?> watchUniversidadesById(String id) {
    return _ref.doc(id).snapshots().map((doc) {
      if (doc.exists) {
        return UniversidadesFb.fromMap(doc.id, doc.data()!);
      }
      return null;
    });
  }

  /// Elimina una universidad
  static Future<void> deleteUniversidades(String id) async {
    await _ref.doc(id).delete();
  }

  /// Stream para observar todas las universidades en tiempo real
  static Stream<List<UniversidadesFb>> watchUniversidades() {
    return _ref.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => UniversidadesFb.fromMap(doc.id, doc.data()))
          .toList();
    });
  }
}
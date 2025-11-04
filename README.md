# 🔥 Taller 3 – Integración con Firebase Firestore en Flutter

**Autora:** Angie Natalia Cobo Vásquez  
**Código:** 230222011  
**Repositorio:** [https://github.com/Angie-Natalia-Cobo-Vasquez/TalleresMoviles](https://github.com/Angie-Natalia-Cobo-Vasquez/TalleresMoviles)  
**Materia:** Desarrollo Móvil - 7° Semestre  
**Institución:** Unidad Central del Valle del Cauca (UCEVA)  
**📅 Fecha:** Noviembre 2025  

---

## 🚀 Módulo: Integración con Firebase Firestore

Este taller corresponde al **Taller 3**, enfocado en la **integración de Firebase Firestore** dentro de una aplicación Flutter para realizar operaciones **CRUD (Crear, Leer, Actualizar, Eliminar)** sobre una colección llamada `universidades`.

---

## 🎯 Objetivo del Taller

Implementar un módulo que permita:

1. 🔗 **Conectarse a Firebase Firestore** desde Flutter.  
2. 🏫 **Gestionar una colección llamada `universidades`** con los campos: nit, nombre, dirección, teléfono y página web.  
3. ✏️ **Realizar operaciones CRUD completas** con actualización en tiempo real.  
4. 🧱 **Separar el código por capas** (modelo, servicio, provider, vista).  
5. 🧩 Aplicar el **flujo GitFlow** para el control de versiones y desarrollo colaborativo.

---

## 🧱 Arquitectura del Proyecto

```
lib/
├── models/                    # Modelos de datos (UniversidadesFb)
├── services/                  # Lógica de Firebase (UniversidadesService)
├── providers/                 # Manejo de estado
├── views/                     # Interfaz de usuario (ListView, FormView)
└── main.dart                  # Punto de entrada con inicialización de Firebase
```

---

## 🔧 Configuración Inicial de Firebase

1. Proyecto creado en **Firebase Console**:  
   **ID:** `electivagrupo2-37aad`  
   **Ubicación:** `nam5 (United States)`  
   **Modo:** Prueba (30 días)

2. Inicialización en `main.dart`:

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

3. Paquetes instalados:

```bash
flutter pub add firebase_core cloud_firestore
flutterfire configure
flutter build apk --debug
```

---

## 🧩 Modelo de Datos – UniversidadesFb

```dart
class UniversidadesFb {
  final String id;
  final String nit;
  final String nombre;
  final String direccion;
  final String telefono;
  final String paginaWeb;
}
```

**Campos implementados:**
| Campo | Tipo | Descripción |
|--------|------|-------------|
| nit | String | Identificación tributaria |
| nombre | String | Nombre de la universidad |
| direccion | String | Dirección física |
| telefono | String | Número de contacto |
| pagina_web | String | URL del sitio web |

---

## ⚙️ Servicio Firebase – UniversidadesService

```dart
class UniversidadesService {
  static final _ref = FirebaseFirestore.instance.collection('universidades');

  static Future<void> addUniversidades(UniversidadesFb universidad);
  static Future<List<UniversidadesFb>> getUniversidades();
  static Future<UniversidadesFb?> getUniversidadesById(String id);
  static Future<void> updateUniversidades(UniversidadesFb universidad);
  static Future<void> deleteUniversidades(String id);
  static Stream<List<UniversidadesFb>> watchUniversidades();
}
```

Permite realizar todas las operaciones CRUD, además de escuchar cambios en tiempo real con Streams.

---

## 🖥️ Interfaz de Usuario

- **Lista principal:** `StreamBuilder` con actualización en tiempo real.  
- **Formulario:** creación y edición de universidades con validaciones.  
- **Diseño responsive:** adaptación a pantallas grandes y pequeñas.  
- **Validaciones:** campos obligatorios y formato de URL.  

---

## 🧭 Navegación y Rutas

Configuración en `app_router.dart`:

```dart
GoRoute(
  path: '/universidadesfb',
  name: 'universidadesfb',
  builder: (...) => const UniversidadesFbListView(),
),
GoRoute(
  path: '/universidadesfb/create',
  name: 'universidadesfb.create',
  builder: (...) => const UniversidadesFbFormView(),
),
GoRoute(
  path: '/universidadesfb/edit/:id',
  name: 'universidadesfb.edit',
  builder: (context, state) {
    final id = state.pathParameters['id']!;
    return UniversidadesFbFormView(id: id);
  },
);
```

Integración en el menú (`custom_drawer.dart`):

```dart
ListTile(
  leading: const Icon(Icons.school),
  title: const Text('Universidades Firebase'),
  onTap: () => context.pushNamed('universidadesfb'),
)
```

---

## 🔄 Flujo de Trabajo con GitFlow

| Rama | Propósito |
|------|------------|
| `main` | Versión estable |
| `dev` | Rama base de desarrollo |
| `feature/taller_firebase_universidades` | Desarrollo del módulo Firebase |

**Proceso:**
1. Crear rama `feature/taller_firebase_universidades` desde `dev`.  
2. Implementar el módulo completo.  
3. Crear PR `feature/taller_firebase_universidades → dev`.  
4. Hacer merge a `main` tras revisión.

---

## 🧪 Pruebas y Validación

- ✅ Sincronización en tiempo real con Firestore.  
- ✅ Validación de campos vacíos y formato URL.  
- ✅ Creación, edición y eliminación de registros.  
- ✅ Verificación de actualización instantánea en la lista principal.  

---

## 📸 Evidencias del Taller

Incluyen capturas de:
- Configuración en Firebase Console.  
- Colección `universidades` con documentos reales.  
- Aplicación móvil mostrando listado, creación y edición.  
- Flujo completo de CRUD y conexión estable con Firestore.

---

## 🧠 Conclusión

Este taller permitió comprender y aplicar la integración entre **Flutter y Firebase Firestore**, reforzando conceptos de **sincronización en tiempo real**, **estructura modular** y **control de versiones con GitFlow**.  
El resultado es un módulo funcional, escalable y con validaciones efectivas para la gestión de datos en la nube.

---

## 📦 Versión Actual

**Versión:** `3.0.0`  
**Rama:** `feature/taller_firebase_universidades`  
**Estado:** ✅ Finalizado y probado  
**Última actualización:** Noviembre 2025  

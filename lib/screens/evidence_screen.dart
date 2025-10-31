import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

class EvidenceScreen extends StatefulWidget {
const EvidenceScreen({super.key});

@override
State<EvidenceScreen> createState() => _EvidenceScreenState();
}

class _EvidenceScreenState extends State<EvidenceScreen> {
String? name;
String? email;
String? userId;
bool hasToken = false;
String? tokenPreview;
String? tokenType;
String? expiresIn;

@override
void initState() {
super.initState();
_loadData();
}

Future<void> _loadData() async {
final prefs = await SharedPreferences.getInstance();
const storage = FlutterSecureStorage();


final token = await storage.read(key: 'token');
final type = await storage.read(key: 'token_type');
final exp = await storage.read(key: 'expires_in');

if (!mounted) return;

setState(() {
  name = prefs.getString('name');
  email = prefs.getString('email');
  userId = prefs.getString('user_id');
  hasToken = token != null;
  tokenPreview = token != null ? '${token.substring(0, 25)}...' : 'No disponible';
  tokenType = type ?? 'bearer';
  expiresIn = exp ?? '7200 segundos';
});


}

@override
Widget build(BuildContext context) {
final auth = context.read<AuthProvider>();


return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.green,
    title: const Text('Dashboard Principal'),
  ),
  body: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bienvenida
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '¡Bienvenido!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name ?? '-',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // SharedPreferences Section
        const Text(
          'SharedPreferences',
          style: TextStyle(
            fontSize: 18,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Datos NO sensibles (sin encriptar)',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        _buildInfoCard([
          _buildInfoRow(Icons.badge, 'ID de Usuario', userId ?? '-'),
          _buildInfoRow(Icons.person, 'Nombre', name ?? '-'),
          _buildInfoRow(Icons.email, 'Email', email ?? '-'),
        ]),

        const SizedBox(height: 25),

        // Secure Storage Section
        const Text(
          'FlutterSecureStorage',
          style: TextStyle(
            fontSize: 18,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Datos SENSIBLES (encriptados)',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        _buildInfoCard([
          _buildInfoRow(Icons.verified_user, 'Token presente', hasToken ? 'Sí' : 'No'),
          _buildInfoRow(Icons.security, 'Token JWT', tokenPreview ?? '-'),
          _buildInfoRow(Icons.lock, 'Tipo de Token', tokenType ?? '-'),
          _buildInfoRow(Icons.timer, 'Expira en', expiresIn ?? '-'),
        ]),

        const SizedBox(height: 40),

        // Logout Button
        Center(
          child: ElevatedButton.icon(
            onPressed: () async {
              await auth.logout();
              if (mounted) {
                context.go('/');
              }
            },
            icon: const Icon(Icons.logout),
            label: const Text('Cerrar sesión'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);

}

Widget _buildInfoCard(List<Widget> children) {
return Card(
elevation: 3,
margin: const EdgeInsets.symmetric(vertical: 8),
child: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(children: children),
),
);
}

Widget _buildInfoRow(IconData icon, String label, String value) {
return Padding(
padding: const EdgeInsets.symmetric(vertical: 6),
child: Row(
children: [
Icon(icon, color: Colors.black54),
const SizedBox(width: 10),
Expanded(
flex: 2,
child: Text(
label,
style: const TextStyle(fontWeight: FontWeight.w500),
),
),
Expanded(
flex: 3,
child: Text(
value,
style: const TextStyle(fontFamily: 'monospace'),
),
),
],
),
);
}
}

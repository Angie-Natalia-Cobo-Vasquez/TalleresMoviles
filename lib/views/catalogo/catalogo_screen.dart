import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talleresmoviles/widgets/custom_drawer.dart';
import 'package:talleresmoviles/widgets/catalog_card.dart';

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final promo = GoRouterState.of(context).uri.queryParameters['promo'] ?? "Sin promo";

    void volverInteligente() {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        context.go('/');
      }
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Catálogo Universitario'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Volver',
            onPressed: volverInteligente,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Libros", icon: Icon(Icons.menu_book)),
              Tab(text: "Tecnología", icon: Icon(Icons.laptop_mac)),
              Tab(text: "Deportes", icon: Icon(Icons.sports_soccer)),
            ],
          ),
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Text(
                  "🎓 Bienvenido al catálogo académico\nPromo activa: $promo",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Buscar en catálogo...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CatalogCard(
                          titulo: "Libro ${index + 1}",
                          imagen: "assets/images/libro.jpg",
                          onTap: () {
                            context.push('/ciclo-vida');
                          },
                        );
                      },
                    ),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CatalogCard(
                          titulo: "Dispositivo ${index + 1}",
                          imagen: "assets/images/laptop.jpg",
                          onTap: () {
                            context.push('/ciclo-vida');
                          },
                        );
                      },
                    ),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CatalogCard(
                          titulo: "Deporte ${index + 1}",
                          imagen: "assets/images/balon.jpg",
                          onTap: () {
                            context.push('/ciclo-vida');
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Volver al Home"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: volverInteligente,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

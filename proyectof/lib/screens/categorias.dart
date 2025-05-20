import 'package:flutter/material.dart';
import 'pantalla_base.dart';

class CategoriasPage extends StatelessWidget {
  final List<Map<String, dynamic>> categorias = [
    {
      'nombre': 'Frutas',
      'icono': Icons.apple,
      'color': Colors.red,
      'ruta': '/buscar',
    },
    {
      'nombre': 'Verduras',
      'icono': Icons.eco,
      'color': Colors.green,
      'ruta': '/buscar',
    },
    {
      'nombre': 'Granos',
      'icono': Icons.rice_bowl,
      'color': Colors.brown,
      'ruta': '/buscar',
    },
    {
      'nombre': 'Proteínas',
      'icono': Icons.set_meal,
      'color': Colors.orange,
      'ruta': '/buscar',
    },
    {
      'nombre': 'Lácteos',
      'icono': Icons.local_drink,
      'color': Colors.blue,
      'ruta': '/buscar',
    },
    {
      'nombre': 'Bebidas',
      'icono': Icons.local_cafe,
      'color': Colors.purple,
      'ruta': '/buscar',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PantallaBase(
      currentIndex: 0,
      contenido: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categorias.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final item = categorias[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context,
                        '/buscar',
                arguments: item['nombre'], // 👉 Envías "Frutas", "Verduras", etc.
);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item['color'].withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icono'], size: 50, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      item['nombre'],
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

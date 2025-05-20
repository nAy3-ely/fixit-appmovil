import 'package:flutter/material.dart';
import './pantalla_base.dart';
import '../models/alimento.dart';
import 'detalle.dart';

class BuscarPage extends StatefulWidget {
  @override
  _BuscarPageState createState() => _BuscarPageState();
}

class _BuscarPageState extends State<BuscarPage> {
  String consulta = '';
  String categoriaSeleccionada = '';

  final List<Alimento> alimentos = [
    // FRUTAS
    Alimento(
      nombre: 'Manzana',
      categoria: 'Frutas',
      imagen: 'assets/images/manzana.jpg',
      descripcion: 'Fruta rica en fibra, antioxidantes y vitamina C.',
      beneficios: ['Mejora digestión', 'Regula el azúcar'],
    ),
    Alimento(
      nombre: 'Banano',
      categoria: 'Frutas',
      imagen: 'assets/images/banano.jpg',
      descripcion: 'Fuente natural de potasio y energía.',
      beneficios: ['Aumenta energía', 'Reduce calambres'],
    ),
    Alimento(
      nombre: 'Naranja',
      categoria: 'Frutas',
      imagen: 'assets/images/naranja.jpg',
      descripcion: 'Fruta cítrica con alto contenido en vitamina C.',
      beneficios: ['Fortalece defensas', 'Antioxidante'],
    ),

    // VERDURAS
    Alimento(
      nombre: 'Brócoli',
      categoria: 'Verduras',
      imagen: 'assets/images/brocoli.jpg',
      descripcion: 'Rico en fibra, vitaminas y antioxidantes.',
      beneficios: ['Protege contra cáncer', 'Mejora digestión'],
    ),
    Alimento(
      nombre: 'Zanahoria',
      categoria: 'Verduras',
      imagen: 'assets/images/zanahoria.jpg',
      descripcion: 'Rica en betacarotenos y vitamina A.',
      beneficios: ['Cuida la visión', 'Mejora la piel'],
    ),

    // LÁCTEOS
    Alimento(
      nombre: 'Yogur',
      categoria: 'Lácteos',
      imagen: 'assets/images/yogur.jpg',
      descripcion: 'Lácteo fermentado con probióticos.',
      beneficios: ['Mejora flora intestinal', 'Fuente de calcio'],
    ),
    Alimento(
      nombre: 'Queso',
      categoria: 'Lácteos',
      imagen: 'assets/images/queso.jpg',
      descripcion: 'Producto derivado de la leche.',
      beneficios: ['Fortalece huesos', 'Fuente de proteínas'],
    ),

    // GRANOS
    Alimento(
      nombre: 'Lentejas',
      categoria: 'Granos',
      imagen: 'assets/images/lentejas.jpg',
      descripcion: 'Ricas en hierro, fibra y proteína vegetal.',
      beneficios: ['Previene anemia', 'Reduce colesterol'],
    ),


    // PROTEÍNAS
    Alimento(
      nombre: 'Pollo',
      categoria: 'Proteínas',
      imagen: 'assets/images/pollo.jpg',
      descripcion: 'Carne blanca baja en grasa.',
      beneficios: ['Ayuda a construir músculo', 'Baja en colesterol'],
    ),


    // BEBIDAS

    Alimento(
      nombre: 'Jugo verde',
      categoria: 'Bebidas',
      imagen: 'assets/images/jugo_verde.jpg',
      descripcion: 'Combinación natural de frutas y verduras.',
      beneficios: ['Desintoxica', 'Aporta energía y vitaminas'],
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is String) {
      categoriaSeleccionada = args;
    }
  }

  @override
  Widget build(BuildContext context) {
    final resultados = alimentos
        .where((a) =>
            (categoriaSeleccionada.isEmpty || a.categoria == categoriaSeleccionada) &&
            a.nombre.toLowerCase().contains(consulta.toLowerCase()))
        .toList();

    return PantallaBase(
      currentIndex: 3,
      contenido: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: categoriaSeleccionada.isEmpty
                    ? 'Buscar alimento...'
                    : 'Buscar en $categoriaSeleccionada...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  consulta = value;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: resultados.isEmpty
                  ? Text(
                      'No se encontraron alimentos en ${categoriaSeleccionada.isEmpty ? "la búsqueda" : categoriaSeleccionada}',
                      style: TextStyle(fontSize: 16),
                    )
                  : ListView.builder(
                      itemCount: resultados.length,
                      itemBuilder: (context, index) {
                        final a = resultados[index];
                        return Card(
                          child: ListTile(
                            leading: Image.asset(
                              a.imagen,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(a.nombre),
                            subtitle: Text(a.categoria),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetallePage(alimento: a),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

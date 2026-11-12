import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/cafe.dart';
import 'detalle_cafe_screen.dart';

class CafesScreen extends StatefulWidget {
  const CafesScreen({super.key});

  @override
  State<CafesScreen> createState() => _CafesScreenState();
}

class _CafesScreenState extends State<CafesScreen> {
  late Future<List<Cafe>> _futuroCafes;

  @override
  void initState() {
    super.initState();
    _futuroCafes = obtenerCafes();
  }

  Future<List<Cafe>> obtenerCafes() async {
    const String url = 'https://api.sampleapis.com/coffee/hot';
    
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> cuerpoJson = json.decode(response.body);
        
        // Filtramos para quitar los datos basura de la API
        final listaFiltrada = cuerpoJson.where((json) {
          final titulo = (json['title'] ?? '').toString().toLowerCase();
          final imagen = (json['image'] ?? '').toString();
          
          // Excluimos títulos de prueba y las imágenes que usan "example.com"
          bool esValido = !titulo.contains('probe') && 
                          !titulo.contains('test') && 
                          !imagen.contains('example.com');
          return esValido;
        }).toList();

        return listaFiltrada.map((json) => Cafe.fromJson(json)).toList();
      }
      throw Exception('Error al obtener cafés: ${response.statusCode}');
    } catch (error) {
      throw Exception('No se pudieron cargar los cafés: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Cafés (API)'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Cafe>>(
        future: _futuroCafes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.brown));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay cafés disponibles.'));
          }

          final listaCafes = snapshot.data!;
          
          return ListView.builder(
            itemCount: listaCafes.length,
            itemBuilder: (context, index) {
              final cafe = listaCafes[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  // Usamos la imagen de la API en lugar de un ícono
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      cafe.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      // Si la imagen falla (porque alguna URL viene rota), mostramos un ícono
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.coffee, size: 60, color: Colors.brown);
                      },
                    ),
                  ),
                  title: Text(
                    cafe.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    cafe.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Navegación a detalles
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleCafeScreen(cafe: cafe),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Importamos el paquete
import '../models/tarea.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _textController = TextEditingController();
  
  final List<Tarea> _tareas = [
    Tarea(titulo: 'tarea5'),
    Tarea(titulo: 'tarea1'),
    Tarea(titulo: 'tarea4'),
    Tarea(titulo: 'tarea2'),
    Tarea(titulo: 'tarea3'),
  ];

  void _agregarTarea() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _tareas.add(Tarea(titulo: _textController.text));
      });
      _textController.clear();
    }
  }

  void _editarTarea(int index) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _editController =
            TextEditingController(text: _tareas[index].titulo);
        return AlertDialog(
          title: const Text('Editar Tarea'),
          content: TextField(
            controller: _editController,
            decoration: const InputDecoration(hintText: 'Nuevo nombre'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _tareas[index].titulo = _editController.text;
                });
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _reordenarTareas(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Tarea tareaMovida = _tareas.removeAt(oldIndex);
      _tareas.insert(newIndex, tareaMovida);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 130, 220, 255),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Ingresa una tarea..',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_box, color: Colors.blue, size: 30),
                  onPressed: _agregarTarea,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          
          Expanded(
            child: ReorderableListView.builder(
              buildDefaultDragHandles: false, 
              itemCount: _tareas.length,
              onReorder: _reordenarTareas,
              itemBuilder: (context, index) {
                
                // AQUÍ REEMPLAZAMOS EL DISMISSIBLE POR SLIDABLE
                return Slidable(
                  key: Key(_tareas[index].titulo + index.toString()),
                  
                  // El botón de acción que se revela al deslizar a la IZQUIERDA
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(), // Tipo de animación
                    extentRatio: 0.5, // Qué tanto se abre (0.5 = 50% de la pantalla)
                    children: [
                      // Botón de Editar
                      SlidableAction(
                        onPressed: (context) => _editarTarea(index),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Editar',
                      ),
                      // Botón de Borrar
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {
                            _tareas.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Tarea eliminada')),
                          );
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Borrar',
                      ),
                    ],
                  ),
                  
                  child: ListTile(
                    title: Text(_tareas[index].titulo),
                    // Mantenemos el ícono de arrastre que ya habíamos arreglado
                    trailing: ReorderableDragStartListener(
                      index: index,
                      child: const Icon(Icons.menu),
                    ),
                    onTap: () => _editarTarea(index), // Tocar también abre la edición
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tareas_provider.dart';

class TareasScreen extends StatelessWidget {
  const TareasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tareasProvider = Provider.of<TareasProvider>(context);
    final idGrupo = 1; // reemplaza con tu id de grupo actual

    return Scaffold(
      appBar: AppBar(title: const Text('Tareas')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tareasProvider.tareas.length,
              itemBuilder: (context, index) {
                final tarea = tareasProvider.tareas[index];
                return ListTile(
                  title: Text(tarea.nombreTarea),
                  subtitle: Text('${tarea.responsable} - ${tarea.fechaLimite}'),
                  trailing: Wrap(
                    children: [
                      Checkbox(
                        value: tarea.estatusTarea == 'Completada',
                        onChanged: (v) => tareasProvider.completarTarea(tarea.idTarea, v ?? false),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => tareasProvider.eliminarTarea(tarea.idTarea, idGrupo),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              final nombreCtrl = TextEditingController();
              final descripcionCtrl = TextEditingController();
              final responsableCtrl = TextEditingController();
              final fechaCtrl = TextEditingController();
              return AlertDialog(
                title: const Text('Agregar Tarea'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: nombreCtrl, decoration: const InputDecoration(labelText: 'Nombre de la tarea')),
                    TextField(controller: descripcionCtrl, decoration: const InputDecoration(labelText: 'Descripción')),
                    TextField(controller: responsableCtrl, decoration: const InputDecoration(labelText: 'Responsable')),
                    TextField(controller: fechaCtrl, decoration: const InputDecoration(labelText: 'Fecha límite (YYYY-MM-DD)')),
                  ],
                ),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                  ElevatedButton(
                    onPressed: () {
                      tareasProvider.agregarTarea(
                        idGrupo: idGrupo,
                        nombreTarea: nombreCtrl.text.trim(),
                        descripcion: descripcionCtrl.text.trim(),
                        responsable: responsableCtrl.text.trim(),
                        fechaLimite: fechaCtrl.text.trim(),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Agregar'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

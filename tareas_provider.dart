import 'package:flutter/material.dart';
import '../modelos/modelos.dart';
import '../services/api_service.dart';

class TareasProvider extends ChangeNotifier {
  List<Tarea> tareas = [];

  /// Cargar todas las tareas de un grupo
  Future<void> cargarTareas(int idGrupo) async {
    try {
      final List<dynamic> data = await ApiService.getTareas(idGrupo);
      tareas = data.map((json) => Tarea.fromJson(json as Map<String, dynamic>)).toList();
      notifyListeners();
    } catch (e) {
      tareas = [];
      notifyListeners();
    }
  }

  /// Marcar tarea como completada o pendiente
  Future<void> completarTarea(int idTarea, bool completada) async {
    bool ok = await ApiService.completarTarea(idTarea, completada);
    if (ok) {
      final t = tareas.firstWhere((t) => t.idTarea == idTarea);
      t.estatusTarea = completada ? 'Completada' : 'Pendiente';
      notifyListeners();
    }
  }

  /// Agregar nueva tarea
  Future<bool> agregarTarea({
    required int idGrupo,
    required String nombreTarea,
    String descripcion = '',
    String responsable = 'Sin asignar',
    String fechaLimite = '',
  }) async {
    final ok = await ApiService.agregarTarea(
      idGrupo: idGrupo,
      nombreTarea: nombreTarea,
      descripcion: descripcion,
      responsable: responsable,
      fechaLimite: fechaLimite,
    );
    if (ok) await cargarTareas(idGrupo);
    return ok;
  }

  /// Eliminar tarea
  Future<bool> eliminarTarea(int idTarea, int idGrupo) async {
    final ok = await ApiService.eliminarTarea(idTarea);
    if (ok) await cargarTareas(idGrupo);
    return ok;
  }
}

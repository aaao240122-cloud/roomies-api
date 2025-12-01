import 'package:flutter/material.dart';
import '../modelos/modelos.dart';
import '../services/api_service.dart';

class GastosProvider extends ChangeNotifier {
  List<Gasto> gastos = [];

  /// Cargar todos los gastos de un grupo
  Future<void> cargarGastos(int idGrupo) async {
    try {
      final List<dynamic> data = await ApiService.getGastos(idGrupo);
      gastos = data.map((json) => Gasto.fromJson(json as Map<String, dynamic>)).toList();
      notifyListeners();
    } catch (e) {
      gastos = [];
      notifyListeners();
    }
  }

  /// Agregar un gasto nuevo
  Future<bool> agregarGasto(String descripcion, double monto, String fecha, int idGrupo, int autorGasto) async {
    final ok = await ApiService.agregarGasto(
      idGrupo: idGrupo,
      autorGasto: autorGasto,
      descripcion: descripcion,
      monto: monto,
      fecha: fecha,
    );
    if (ok) await cargarGastos(idGrupo);
    return ok;
  }

  /// Eliminar un gasto
  Future<bool> eliminarGasto(int idGasto, int idGrupo) async {
    final ok = await ApiService.eliminarGasto(idGasto);
    if (ok) await cargarGastos(idGrupo);
    return ok;
  }
}

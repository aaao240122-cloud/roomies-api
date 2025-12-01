import 'package:flutter/material.dart';
import '../modelos/modelos.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  Usuario? usuario;
  bool cargando = false;

  /// Registro de usuario
  Future<bool> register(String nombre, String correo, String password) async {
    cargando = true;
    notifyListeners();

    try {
      // Devuelve Usuario? o null si falla
      final Usuario? u = await ApiService.register(
        nombre: nombre,
        correo: correo,
        password: password,
      );

      cargando = false;
      notifyListeners();

      if (u != null) {
        usuario = u;
        return true;
      }

      return false;
    } catch (e) {
      cargando = false;
      notifyListeners();
      return false;
    }
  }

  /// Login de usuario
  Future<bool> login(String correo, String password) async {
    cargando = true;
    notifyListeners();

    try {
      final Usuario? u = await ApiService.login(correo, password);

      cargando = false;
      notifyListeners();

      if (u != null) {
        usuario = u;
        return true;
      }

      return false;
    } catch (e) {
      cargando = false;
      notifyListeners();
      return false;
    }
  }

  /// Logout
  void logout() {
    usuario = null;
    notifyListeners();
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelos/modelos.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2/mi_app_backend"; // Cambia según tu URL

  /// Registro de usuario
  static Future<Usuario?> register({
    required String nombre,
    required String correo,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register.php'),
      body: {
        'nombre': nombre,
        'correo': correo,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success'] == true) {
        return Usuario.fromJson(data['usuario']);
      }
    }
    return null;
  }

  /// Login de usuario
  static Future<Usuario?> login(String correo, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      body: {
        'correo': correo,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success'] == true) {
        return Usuario.fromJson(data['usuario']);
      }
    }
    return null;
  }

  /// Obtener gastos
  static Future<List<Map<String, dynamic>>> getGastos(int idGrupo) async {
    final response = await http.get(Uri.parse('$baseUrl/gastos.php?idGrupo=$idGrupo'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is List) return List<Map<String, dynamic>>.from(data);
    }
    return [];
  }

  /// Agregar gasto
  static Future<bool> agregarGasto({
    required int idGrupo,
    required int autorGasto,
    required String descripcion,
    required double monto,
    required String fecha,
    String? tipo,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/agregar_gasto.php'),
      body: {
        'idGrupo': idGrupo.toString(),
        'autorGasto': autorGasto.toString(),
        'descripcion': descripcion,
        'monto': monto.toString(),
        'fecha': fecha,
        'tipo': tipo ?? '',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['success'] == true;
    }
    return false;
  }

  /// Eliminar gasto
  static Future<bool> eliminarGasto(int idGasto) async {
    final response = await http.post(
      Uri.parse('$baseUrl/eliminar_gasto.php'),
      body: {'idGasto': idGasto.toString()},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['success'] == true;
    }
    return false;
  }

  /// Obtener tareas
  static Future<List<Map<String, dynamic>>> getTareas(int idGrupo) async {
    final response = await http.get(Uri.parse('$baseUrl/tareas.php?idGrupo=$idGrupo'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is List) return List<Map<String, dynamic>>.from(data);
    }
    return [];
  }

  /// Agregar tarea
  static Future<bool> agregarTarea({
    required int idGrupo,
    required String nombreTarea,
    String descripcion = '',
    String responsable = 'Sin asignar',
    String fechaLimite = '',
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/agregar_tarea.php'),
      body: {
        'idGrupo': idGrupo.toString(),
        'nombreTarea': nombreTarea,
        'descripcion': descripcion,
        'responsable': responsable,
        'fechaLimite': fechaLimite,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['success'] == true;
    }
    return false;
  }

  /// Eliminar tarea
  static Future<bool> eliminarTarea(int idTarea) async {
    final response = await http.post(
      Uri.parse('$baseUrl/eliminar_tarea.php'),
      body: {'idTarea': idTarea.toString()},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['success'] == true;
    }
    return false;
  }

  /// Completar tarea
  static Future<bool> completarTarea(int idTarea, bool completada) async {
    final response = await http.post(
      Uri.parse('$baseUrl/completar_tarea.php'),
      body: {
        'idTarea': idTarea.toString(),
        'completada': completada ? '1' : '0',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['success'] == true;
    }
    return false;
  }

  /// Obtener resumen
  static Future<Map<String, dynamic>> getResumen(int idUsuario) async {
    final response = await http.get(Uri.parse('$baseUrl/resumen.php?idUsuario=$idUsuario'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is Map<String, dynamic>) return data;
    }
    return {
      'totalGastos': 0,
      'tareasPendientes': 0,
      'tareasCompletadas': 0,
    };
  }
}

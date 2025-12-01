// lib/utilidades/validaciones.dart
class Validaciones {
  static String? nonEmpty(String? v, {String fieldName = 'Este campo'}) {
    if (v == null || v.trim().isEmpty) return '$fieldName es requerido';
    return null;
  }

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return 'Correo es requerido';
    final pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final reg = RegExp(pattern);
    if (!reg.hasMatch(v.trim())) return 'Ingresa un correo válido';
    return null;
  }

  static String? minLength(String? v, int length, {String? fieldName}) {
    if (v == null || v.length < length) {
      return '${fieldName ?? "El campo"} debe tener al menos $length caracteres';
    }
    return null;
  }

  static String? password(String? v) {
    // validación simple: mínimo 6 caracteres
    return minLength(v, 6, fieldName: 'Contraseña');
  }

  static bool isEmail(String v) {
    final pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return RegExp(pattern).hasMatch(v.trim());
  }
}

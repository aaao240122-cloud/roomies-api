class Usuario {
  final int idUsuario;
  final String nombre;
  final String correo;
  final String password;
  final int idGrupo;

  Usuario({
    required this.idUsuario,
    required this.nombre,
    required this.correo,
    required this.password,
    required this.idGrupo,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: int.parse(json['idUsuario'].toString()),
      nombre: json['nombre'] ?? '',
      correo: json['correo'] ?? '',
      password: json['password'] ?? '',
      idGrupo: int.parse(json['idGrupo'].toString()),
    );
  }
}

class Tarea {
  final int idTarea;
  final int idGrupo;
  final String nombreTarea;
  final String descripcion;
  final String responsable;
  final String fechaLimite;
  String estatusTarea;

  Tarea({
    required this.idTarea,
    required this.idGrupo,
    required this.nombreTarea,
    required this.descripcion,
    required this.responsable,
    required this.fechaLimite,
    required this.estatusTarea,
  });

  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      idTarea: int.parse(json['idTarea'].toString()),
      idGrupo: int.parse(json['idGrupo'].toString()),
      nombreTarea: json['nombreTarea'] ?? '',
      descripcion: json['descripcion'] ?? '',
      responsable: json['responsable'] ?? 'Sin asignar',
      fechaLimite: json['fechaLimite'] ?? '',
      estatusTarea: json['estatusTarea'] ?? 'Pendiente',
    );
  }
}

class Gasto {
  final int idGasto;
  final int idGrupo;
  final String descripcion;
  final double monto;
  final String? tipo;
  final int autorGasto;
  final String fecha;

  Gasto({
    required this.idGasto,
    required this.idGrupo,
    required this.descripcion,
    required this.monto,
    this.tipo,
    required this.autorGasto,
    required this.fecha,
  });

  factory Gasto.fromJson(Map<String, dynamic> json) {
    return Gasto(
      idGasto: int.parse(json['idGasto'].toString()),
      idGrupo: int.parse(json['idGrupo'].toString()),
      descripcion: json['descripcion'] ?? '',
      monto: double.tryParse(json['monto'].toString()) ?? 0.0,
      tipo: json['tipo'], // puede ser null
      autorGasto: int.parse(json['autorGasto'].toString()),
      fecha: json['fecha'] ?? '',
    );
  }
}

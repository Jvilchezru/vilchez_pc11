class User {

  String? codigo;
  String? dni;
  String? nombre;
  String? apellidos;

  String? mensaje;
  String? estado;

  User(
    this.codigo, 
    this.dni, 
    this.nombre, 
    this.apellidos
  );

  User.fromListJson(Map<String, dynamic> json) {
    codigo = json['v1'];
    dni = json['v2'];
    nombre = json['v3'];
    apellidos = json['v4'];
  }

  User.fromSaveJson(Map<String, dynamic> json) {
    mensaje = json['mensaje'];
    estado = json['estado'];
  }
}
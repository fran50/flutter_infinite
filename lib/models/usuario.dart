class Usuario {
  String id, nombre, email, role;
  // Usuario(this.id, this.nombre, this.email, this.role);
  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    nombre = json['nombre'];
    email = json['email'];
    //password = json['password'];
    // img = json['img'];
    role = json['role'];
  }
}

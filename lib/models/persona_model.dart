//https://javiercbk.github.io/json_to_dart/

class Persona {
  String? nombre;
  String? apellido;
  String? email;
  String? celular;
  String? foto;

  Persona({this.nombre, this.apellido, this.email, this.celular, this.foto});

  Persona.fromJson(Map<String, dynamic> json) {
    nombre = json['name']['first'];
    apellido = json['name']['last'];
    email = json['email'];
    celular = json['cell'];
    foto = json['picture']['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['apellido'] = this.apellido;
    data['email'] = this.email;
    data['celular'] = this.celular;
    data['foto'] = this.foto;
    return data;
  }
}
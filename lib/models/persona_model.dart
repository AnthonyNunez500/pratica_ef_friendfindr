//https://javiercbk.github.io/json_to_dart/

class Persona {
  String? nombre;
  String? apellido;
  String? email;
  String? celular;
  String? foto;
  String? titulo;
  String? genero;
  String? ciudad;
  int? favorited;

  Persona({this.nombre, this.apellido, this.email, this.celular, this.foto, this.titulo, this.genero, this.ciudad, this.favorited});

  Persona.fromJson(Map<String, dynamic> json) {
    nombre = json['name']['first'];
    apellido = json['name']['last'];
    email = json['email'];
    celular = json['cell'];
    foto = json['picture']['thumbnail'];
    titulo = json['name']['title'];
    genero = json['gender'];
    ciudad = json['location']['city'];
    foto = json['picture']['thumbnail'];
    favorited = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['apellido'] = this.apellido;
    data['email'] = this.email;
    data['celular'] = this.celular;
    data['foto'] = this.foto;
    data['titulo'] = this.titulo;
    data['genero'] = this.genero;
    data['ciudad'] = this.ciudad;
    data['favorited'] = this.favorited;
    return data;
  }
}
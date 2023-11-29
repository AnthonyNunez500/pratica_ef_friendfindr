class Favorito {
  int? id;
  String? nombre;
  String? titulo;
  String? genero;
  String? ciudad;
  String? foto;

  Favorito({this.titulo, this.nombre, this.genero, this.ciudad, this.foto, this.id});

  Favorito.fromJson(Map<String, dynamic> json) {
    id = 0;
    titulo = json['name']['title'];
    nombre = json['name']['first'];
    genero = json['gender'];
    ciudad = json['city'];
    foto = json['picture']['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = (id == 0)? null : id;
    data['titulo'] = this.titulo;
    data['nombre'] = this.nombre;
    data['genero'] = this.genero;
    data['ciudad'] = this.ciudad;
    data['foto'] = this.foto;
    return data;
  }

}
import 'dart:convert';

import 'package:pratica_ef_friendfindr/models/persona_model.dart';
import 'package:http/http.dart' as http;
class HttpHelper{
  final String urlBase = 'https://randomuser.me/api';

  Future<List> getXPersonas(String x) async{

    print(x);

    final String urlFinal = '$urlBase/?results=$x';
    http.Response response = await http.get(Uri.parse(urlFinal));

    if (response.statusCode == 200){
      final jsonResponse = json.decode(response.body);
      final personasMap = jsonResponse['results'];
      print(personasMap);

      List personas = personasMap.map(
          (i) => Persona.fromJson(i)
      ).toList();
      return personas;
    }
    else{
      throw Exception('Error al cargar los datos');
    }
  }
}
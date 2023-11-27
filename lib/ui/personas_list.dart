import 'package:flutter/material.dart';
import 'package:pratica_ef_friendfindr/models/persona_model.dart';
import 'package:pratica_ef_friendfindr/services/http_helper.dart';

class PersonasList extends StatefulWidget {
  int x;

  PersonasList({super.key, required this.x});

  @override
  State<PersonasList> createState() => _PersonasListState();
}

class _PersonasListState extends State<PersonasList> {
  late Future<List> personas;
  late HttpHelper helper;

  @override
  void initState(){
    helper = HttpHelper();
    personas = helper.getXPersonas(widget.x.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.x <= 0){
      return SizedBox(height: 16);
    }
    else{
      personas = helper.getXPersonas(widget.x.toString());
      return FutureBuilder<List>(
          future: personas,
          builder: (context, snapshot){
             if (snapshot.hasData){
               List<Persona> aux = List<Persona>.from(snapshot.data as Iterable);
               return Expanded(
                 child: ListView.builder(
                     scrollDirection: Axis.vertical,
                     shrinkWrap: true,
                     itemCount: aux.length,
                     itemBuilder: (BuildContext context, int id){
                       return Card(
                         color: Colors.white,
                         elevation: 2.0,
                         child: ListTile(
                           leading: Image.network(aux[id].foto ?? ''),
                           title: Text('${aux[id].nombre} ${aux[id].apellido}'),
                           subtitle: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.stretch,
                             children: [
                               Text('email: ${aux[id].email}'),
                               Text(
                                 'celular: ${aux[id].celular}'
                               )
                             ],
                           ),
                           trailing: IconButton(
                               onPressed: (){},
                               icon: Icon(Icons.favorite)
                           ),
                         ),
                       );
                     }
                 ),
               );
             }
             else if (snapshot.hasError){
               return Text('${snapshot.error}');
             }
             return const CircularProgressIndicator();
          }
      );
    }
  }
}
/*

*/

import 'package:flutter/material.dart';
import 'package:pratica_ef_friendfindr/models/persona_model.dart';
import 'package:pratica_ef_friendfindr/services/http_helper.dart';

class PersonasList extends StatefulWidget {
  final int x;
  const PersonasList({super.key, required this.x});

  @override
  State<PersonasList> createState() => _PersonasListState();
}

class _PersonasListState extends State<PersonasList> {
  late List personas;

  late HttpHelper helper;


  Future initialize() async{
    personas = (await helper.getXPersonas(widget.x.toString()));
    setState(() {
      personas = personas;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (widget.x < 0){
      return SizedBox(height: 16);
    }
    else if (personas.isNotEmpty){
      return
        ListView.builder(
            itemCount: personas.length,
            itemBuilder: (BuildContext context, int id){
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: Image.network(personas[id].foto),
                  title: Text(personas[id].nombre + ' ' + personas[id].apellido),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('email: ' + personas[id].email),
                      Text('celular: ' + personas[id].celular)
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.favorite)
                  ),
                ),
              );
            }
        );
    }
    return const CircularProgressIndicator();
  }
  @override
  void initState(){
    helper = HttpHelper();
    initialize();
    super.initState();
  }
}

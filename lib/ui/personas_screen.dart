import 'package:flutter/material.dart';
import 'package:pratica_ef_friendfindr/ui/personas_list.dart';

class PersonasScreen extends StatefulWidget {
  const PersonasScreen({super.key});

  @override
  State<PersonasScreen> createState() => _PersonasScreenState();
}

class _PersonasScreenState extends State<PersonasScreen> {
  TextEditingController controller = TextEditingController();
  int x = 0;
  var personaList = PersonasList(x: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Personas")
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child:
                      TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Ingrese el número de personas',
                          )
                      )
                  ),
                  IconButton(
                      onPressed: (){
                        setState(() {
                          x = int.parse(controller.text);
                          //print(x);
                          personaList = PersonasList(x: x);
                        });
                      },
                      icon: Icon(Icons.search)
                  ),
                ],
              ),
              SizedBox(height: 16),
              personaList
            ]
        )
      )
    );
  }
}

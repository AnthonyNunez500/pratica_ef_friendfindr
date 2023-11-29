import 'package:flutter/material.dart';

import '../models/favorito_model.dart';
import '../services/db_helper.dart';

class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({super.key});

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  DbHelper helper = DbHelper();
  List<Favorito> favoritos = [];
  @override
  void initState(){
    DbHelper.dbHelper.openDb();
    super.initState();
  }
  Future showData() async {
    await helper.openDb();
    favoritos = await helper.getFavourites();
    setState(() {
      favoritos = favoritos;
    });
  }
  Future deleteData(Favorito favorito) async{
    await helper.deleteFavourite(favorito);
    favoritos = await helper.getFavourites();
    setState(() {
      favoritos = favoritos;
    });
  }
  @override
  Widget build(BuildContext context) {
    showData();
    return
      Scaffold(
        appBar: AppBar(
            title: Text("Favoritos")
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  child:
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:favoritos.length,
                      itemBuilder: (BuildContext context, int id){
                        return Card(
                          color: Colors.white,
                          elevation: 2.0,
                          child: ListTile(
                            leading: Image.network(favoritos[id].foto ?? ''),
                            title: Text('${favoritos[id].titulo} ${favoritos[id].nombre}'),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('genero: ${favoritos[id].genero}'),
                                Text('ciudad: ${favoritos[id].ciudad}')
                              ],
                            ),

                            trailing: IconButton(
                                onPressed: (){
                                  deleteData(favoritos[id]);
                                },
                                icon: Icon(Icons.delete_rounded)
                            ),
                            onLongPress: (){
                              deleteData(favoritos[id]);
                            },
                          ),
                        );
                      }
                  )
              ),
            ],
          ),
        ),
      );
  }
}

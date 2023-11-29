import 'package:pratica_ef_friendfindr/models/favorito_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  final int version = 1;
  Database? db;

  static final DbHelper dbHelper = DbHelper.internal();

  DbHelper.internal();

  factory DbHelper(){
    return dbHelper;
  }

  Future<Database> openDb() async{
    db ??= await openDatabase(
        join(await getDatabasesPath(), 'favourite.db'),
        onCreate: (database, version){
            database.execute(
                'CREATE TABLE favourites(id INTEGER PRIMARY KEY, nombre TEXT, titulo TEXT, genero TEXT, ciudad TEXT, foto TEXT)'
            );
        },
        version: version
      );
    return db!;
  }

  Future<int> insertFavorite(Favorito favorito) async{
    int id = await db!.insert(
        'favourites',
        favorito.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
    return id;
  }

  Future<List<Favorito>> getFavourites() async{
    final List<Map<String,dynamic>> maps = await db!.query('favourites');
    return List.generate(
        maps.length,
            (i){
          Favorito f = Favorito();
          f.id = maps[i]['id'];
          f.nombre = maps[i]['nombre'];
          f.titulo = maps[i]['titulo'];
          f.genero = maps[i]['genero'];
          f.ciudad = maps[i]['ciudad'];
          f.foto = maps[i]['foto'];
          return f;
        }
    );
  }

  Future<int> deleteFavourite(Favorito favorito) async{
    int result = await db!.delete('favourites', where: 'id = ?', whereArgs: [favorito.id]);
    return result;
  }
}
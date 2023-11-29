import 'package:flutter/material.dart';
import 'package:pratica_ef_friendfindr/models/favorito_model.dart';
import 'package:pratica_ef_friendfindr/services/db_helper.dart';
import 'package:pratica_ef_friendfindr/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DbHelper dbHelper = DbHelper();
  //List<Favorito> favoritos = [];

  @override
  void initState() {
    DbHelper.dbHelper.openDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FriendFindr",
      home: HomeScreen(),
    );
  }
}

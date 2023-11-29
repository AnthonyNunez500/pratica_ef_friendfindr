import 'package:flutter/material.dart';
import 'package:pratica_ef_friendfindr/ui/favoritos_screen.dart';
import 'package:pratica_ef_friendfindr/ui/personas_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body:
      Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/skeletonG.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 64),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context)=>
                      PersonasScreen()));
                },
                child: Text("Personas")
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context)=>
                      FavoritosScreen()));
                },
                child: Text("Favoritos")
            )
          ],
        ),
      ),
    );
  }
}

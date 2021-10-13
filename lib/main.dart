import 'package:flutter/material.dart';
import 'package:lab_03_flutter_curso/routes/HomePage.dart';
import 'package:lab_03_flutter_curso/routes/add_pet_page.dart';
import 'package:lab_03_flutter_curso/routes/detail_pet_page.dart';
import 'package:lab_03_flutter_curso/routes/edit_pet_page.dart';
import 'routes/admin_pet_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'add': (context) => AddPetPage(),
        'admin': (context) => AdminPetPage(),
        'detail': (context) => DetailPetPage(),
        'edit': (context) => EditPetPage(),
      },
      debugShowCheckedModeBanner: false,
      title: "Save A Friend",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*
       * hacemos un wrapper Builder para no tenere problemas
       * con el Navigator hacia AdminPage y otras rutas.
      */
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Salva a un amigo"),
          ),
          /* INICIO DRAWER */
          drawer: Drawer(
            child: ListView(
              //lista de elementos
              children: <Widget>[
                //array
                UserAccountsDrawerHeader(
                  accountName: Text("Guillermo Canales"),
                  accountEmail: Text("memoadian@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/logo_flutter.png'),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/drawer_bg.jpg'))),
                ),
                ListTile(
                  //elemento de la lista
                  leading: Icon(Icons.home), //icono, puede ser una imagen
                  title: Text('Inicio'), //texto del título
                  //onTap: () {}, //lo manejaremos más adelante
                ),
                ListTile(
                  //elemento de la lista
                  leading: Icon(Icons.pets),
                  title: Text('Administrar'),
                  onTap: () {
                    //declaramos el evento para este elemento
                    Navigator.pushNamed(context, 'admin');
                  },
                )
              ],
            ),
          ),
          /* FIN DRAWER */
          body: HomePetPage(),
        ),
      ),
    );
  }
}

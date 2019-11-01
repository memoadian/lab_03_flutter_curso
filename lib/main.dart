import 'package:flutter/material.dart';
import 'routes/HomePage.dart';
import 'routes/AdminPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Save A Friend",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*
       * hacemos un wrapper Builder para no tenere problemas
       * con el Navigator hacia AdminPage y otras rutas.
      */
      home: Builder (
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Salva a un amigo"),
          ),
          /* INICIO DRAWER */
          drawer: Drawer(
            child: ListView(//lista de elementos
              children: <Widget>[//array
                ListTile(//elemento de la lista
                  leading: Icon(Icons.home),//icono, puede ser una imagen
                  title: Text('Inicio'),//texto del título
                  //onTap: () {}, //lo manejaremos más adelante
                ),
                ListTile(//elemento de la lista
                  leading: Icon(Icons.pets),
                  title: Text('Administrar'),
                  onTap: () {//declaramos el evento para este elemento
                    Navigator.push(context,//creamos una instancia Navigator con el contexto
                      MaterialPageRoute(//instancia Material Page Route
                        builder: (context) => AdminPage(),//mandamos al adminpage
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          /* FIN DRAWER */
          body: HomePage(),
        ),
      ),
    );
  }
}
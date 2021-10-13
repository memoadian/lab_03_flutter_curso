import 'package:flutter/material.dart';
import 'package:lab_03_flutter_curso/routes/detail_pet_page.dart'; //importamos la página de detalle

class HomePetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //cambiamos el column por un ListView
        children: <Widget>[
          //array
          Card(
            //creamos una card
            margin: EdgeInsets.all(10.0), //margen de 10
            child: Column(
              //creamos una columna para colocar varios hijos
              children: <Widget>[
                //array
                Container(
                  //contenedor de imagen
                  padding: EdgeInsets.all(10.0), //padding
                  child:
                      Image.asset('assets/logo_flutter.png'), //imagen interna
                ),
                Container(
                  //contenedor de texto
                  padding: EdgeInsets.all(10.0), //padding
                  child: Text('Flutter', //título
                      style: TextStyle(fontSize: 18) //estilo del texto
                      ),
                ),
                Container(
                  child: TextButton.icon(
                    //instancia del icono de navegación
                    icon:
                        Icon(Icons.remove_red_eye, //definimos nombre del icono
                            size: 18.0, //tamaño
                            color: Colors.blue //color
                            ),
                    label: Text('Ver amigo'), //nombre del botón
                    onPressed: () {
                      //evento press
                      Navigator.pushNamed(context, 'detail');
                    },
                  ),
                )
              ],
            ),
          ),
          //... podemos añadir varias cards. Por defecto ListView es scrollable

          /* AÑADIR Más CARDS CON DATOS DUMMY*/
          Card(
            //creamos una card
            margin: EdgeInsets.all(10.0), //margen de 10
            child: Column(
              //creamos una columna para colocar varios hijos
              children: <Widget>[
                //array
                Container(
                  //contenedor de imagen
                  padding: EdgeInsets.all(10.0), //padding
                  child:
                      Image.asset('assets/logo_flutter.png'), //imagen interna
                ),
                Container(
                  //contenedor de texto
                  padding: EdgeInsets.all(10.0), //padding
                  child: Text('Flutter 2', //título
                      style: TextStyle(fontSize: 18) //estilo del texto
                      ),
                ),
                Container(
                  child: TextButton.icon(
                    //instancia del icono de navegación
                    icon:
                        Icon(Icons.remove_red_eye, //definimos nombre del icono
                            size: 18.0, //tamaño
                            color: Colors.blue //color
                            ),
                    label: Text('Ver amigo'), //nombre del botón
                    onPressed: () {
                      //evento press
                      Navigator.pushNamed(context, 'detail');
                    },
                  ),
                )
              ],
            ),
          ),
          Card(
            //creamos una card
            margin: EdgeInsets.all(10.0), //margen de 10
            child: Column(
              //creamos una columna para colocar varios hijos
              children: <Widget>[
                //array
                Container(
                  //contenedor de imagen
                  padding: EdgeInsets.all(10.0), //padding
                  child:
                      Image.asset('assets/logo_flutter.png'), //imagen interna
                ),
                Container(
                  //contenedor de texto
                  padding: EdgeInsets.all(10.0), //padding
                  child: Text('Flutter 3', //título
                      style: TextStyle(fontSize: 18) //estilo del texto
                      ),
                ),
                Container(
                  child: TextButton.icon(
                    //instancia del icono de navegación
                    icon:
                        Icon(Icons.remove_red_eye, //definimos nombre del icono
                            size: 18.0, //tamaño
                            color: Colors.blue //color
                            ),
                    label: Text('Ver amigo'), //nombre del botón
                    onPressed: () {
                      //evento press
                      Navigator.pushNamed(context, 'detail');
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

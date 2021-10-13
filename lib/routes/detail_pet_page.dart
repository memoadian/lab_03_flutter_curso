import 'package:flutter/material.dart';

class DetailPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de Amigo"),
      ),
      body: Container(
        child: Card(//creamos una card
          margin: EdgeInsets.all(10.0),//margen de 10
          child: Column(//creamos una columna para colocar varios hijos
            mainAxisSize: MainAxisSize.min,//definimos ualtura ajustable a contenido
            children: <Widget>[//array
              Container (//contenedor de imagen
                padding: EdgeInsets.all(10.0),//padding
                child: Image.asset('assets/logo_flutter.png'),//imagen interna
              ),
              Container (//contenedor de texto
                padding: EdgeInsets.all(10.0),//padding
                child: Text('Flutter 2',//título
                  style: TextStyle(fontSize: 18)//estilo del texto
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(//descripción
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'+
                  'Ut blandit porta lectus, ut vulputate ligula maximus quis.'+
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'+
                  'Ut blandit porta lectus, ut vulputate ligula maximus quis.'
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
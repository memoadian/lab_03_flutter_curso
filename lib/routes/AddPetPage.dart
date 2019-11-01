import 'package:flutter/material.dart';

class AddPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir Amigo"),
      ),
      body: FormAddPet()
    );
  }
}

class FormAddPet extends StatefulWidget {
  @override
  createState() => FormAddPetState();
}

class FormAddPetState extends State<FormAddPet> {
  //añadimos un List con el tipo de opciones que necesitamos mostrar
  List<String> _types = ['Perrito', 'Gatito'];
  //declaramos una variable donde guardaremos el item seleccionado
  String _selectedType = 'Por favor escoge';
  bool _rescue = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(//creamos una vista scrolleable
      child: Form(//añadimos un form
        child: Container(//añadimos un contenedor
          padding: EdgeInsets.all(10.0),//padding
          child: Column(//column para multiples hijos
            children: <Widget>[//array
              TextFormField(//text form field para validar
                decoration: InputDecoration(
                  hintText: 'Nombre', //placeholder
                  labelText: 'Nombre:' //label
                ),
              ),
              TextFormField(//text form field para validar
                //keyboard type multiline para escribir texto largo
                keyboardType: TextInputType.multiline,
                maxLines: null,//definimos null para no poner limites
                decoration: InputDecoration(
                  hintText: 'Descripción', //placeholder
                  labelText: 'Descripción:' //label
                ),
              ),
              TextFormField(//text form field para validar
                //input de tipo numérico
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Edad', //placeholder
                  labelText: 'Edad:' //label
                ),
              ),
              DropdownButton<String>(//Declaramos el widget dropdown
                hint: Text(_selectedType),//texto placeholder
                isExpanded: true,//expandimos el elemento al 100%
                items: _types.map((String value) {//mapeamos el array de tipos
                  return DropdownMenuItem(//retornamos cada item
                    value: value,//valor
                    child: Text(value),//texto del valor
                  );
                }).toList(),//convertimos en lista
                onChanged: (String newValue) {//evento change
                  setState(() {//seteamos el estado
                    _selectedType = newValue;//cambiamos el elemento seleccionado
                  });
                },
              ),
              //usamos switch list tile en lugar de switch para colocar un
              //label a la izquierda y no centrar el switch
              SwitchListTile(
                title: Text('Rescatado'),//label
                value: _rescue,//activo o inactivo
                onChanged: (bool value) {//evento change param bool
                  setState(() {//set state dentro de stateful widget
                    _rescue = value;//seteamos el nuevo valor de _rescue
                  });
                },
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () => {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Icon(Icons.send),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Enviar', textAlign: TextAlign.center)
                        ]
                      )
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
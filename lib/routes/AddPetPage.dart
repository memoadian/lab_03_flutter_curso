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
  //variable auxiliar SwitchListTile
  bool _rescue = false;

  //global key para validar
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(//creamos una vista scrolleable
      child: Form(//añadimos un form
        key: _formKey, //añadimos la llave a nuestro form
        child: _form(),//llamamos desde aqui la funcion que construye el form
      ),
    );
  }

  Widget _form () {
    return Container(//añadimos un contenedor
      padding: EdgeInsets.all(10.0),//padding
      child: Column(//column para multiples hijos
        children: <Widget>[//array
          TextFormField(//text form field para validar
            decoration: InputDecoration(
              icon: Icon(Icons.pets),//añadimos un icono
              hintText: 'Nombre', //placeholder
              labelText: 'Nombre:' //label
            ),
            maxLength: 32,
            //usamos una función flecha para llamar la función validar
            validator: (value) => _validReq(value, 'Coloca un nombre a tu amigo'),
          ),
          TextFormField(//text form field para validar
            //keyboard type multiline para escribir texto largo
            keyboardType: TextInputType.multiline,
            maxLines: null,//definimos null para no poner limites
            decoration: InputDecoration(
              icon: Icon(Icons.book),//añadimos un icono
              hintText: 'Descripción', //placeholder
              labelText: 'Descripción:' //label
            ),
            maxLength: 512,
            validator: (value) => _validReq(value, 'Agrega una descripción'),
          ),
          TextFormField(//text form field para validar
            //input de tipo numérico
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.date_range),//añadimos un icono
              hintText: 'Edad en años', //placeholder
              labelText: 'Edad (Años):' //label
            ),
            maxLength: 2,
            validator: (value) => _validAge(value, 'Coloca la edad aproximada de tu amigo'),
          ),
          Container(//agregamos un container para manejar espacios
            padding: EdgeInsets.only(left: 5.0, top: 10.0),//padding left y top
            child: DropdownButton<String>(//Declaramos el widget dropdown
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
          SizedBox(//sized box permite manejar dimensiones de sus hijos
            width: double.infinity,//colocamos un ancho que se ajuste al padre
            child: RaisedButton(//declaramos el botón sin icono
              onPressed: () => _validateForm(),//al presionar llamamos la funcion validar
              color: Colors.blue,//color
              textColor: Colors.white,//color de texto
              //usamos stack para colocar el icono
              //este elemento nos permite posicionar elementos
              //superpuestos en otros sin afectar espacios
              child: Stack(
                alignment: Alignment.centerLeft,//alineamos al centro a la izquierda
                children: <Widget>[//array de hijos
                  Icon(Icons.send),//icono
                  //colocamos un row para contener el label y ocupar
                  //todo el ancho disponible del botón
                  Row(
                    //centramos el texto
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[//array
                      Text('Enviar')//texto, aqui centrar no sirve
                    ]
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }

  void _validateForm () {
    _formKey.currentState.validate();
  }

  String _validReq (String value, String message) {
    //colocamos un condicional corto
    return (value.length == 0) ? message : null;
  }

  String _validAge (String value, String message) {//validar edad
    String patttern = r'(^[0-9]+$)';//usamos un regex para 2 digitos
    RegExp regExp = RegExp(patttern);//instanciamos la clase
    if (value.length == 0) {//validamos primero si no esun input vacío
      return message;//retornamos el mensaje personalizado
    } else if (!regExp.hasMatch(value)) {//validamos si el contenido hace match
      return 'La edad debe ser un número';//retornamos mensaje por defecto
    } else {//si todo está bien
      return null;//retornamos null
    }
  }
}
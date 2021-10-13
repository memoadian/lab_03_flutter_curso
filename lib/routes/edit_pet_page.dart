import 'package:flutter/material.dart';

class EditPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Amigo"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text('Editar Amigo'),
          ),
        ],
      ),
    );
  }
}

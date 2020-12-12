import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(SegundaOpcionFinal());

class SegundaOpcionFinal extends StatelessWidget {
  const SegundaOpcionFinal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Segunda Opcion Final",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

final TextEditingController val = new TextEditingController();
//Creando variables controladoras"Controller" para que cuando escriba se guarde automaticamente ahi
//final TextEditingController val1 = new TextEditingController();

class _InicioState extends State<Inicio> {
  String v = "Respuesta";
  //String valor;

  void escribir(String hola) {
    setState(() {
      v = hola.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Segunda Opcion Final",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black12,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
        child: Column(
          children: [
            //Donde ingresamos el numero
            TextFormField(
              controller: val,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              //Apartir de aqui ya no es necesario
              decoration: InputDecoration(
                hintText: "Ingesar Numero",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38)),
              ),
            ),

            //BOTON
            FlatButton(
              onPressed: () {
                funcionNumero(val.text);
              },
              child: Text(
                "Conseguir Respuesta",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              color: Colors.black38,
            ),
            Text(
              '$v',
              style: TextStyle(color: Colors.black54, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> funcionNumero(String numeroController) async {
    final link =
        'https://finalopcion220201212112100.azurewebsites.net/api/numeros?numero=$numeroController';

    print(link);
    final response = await http.get(link, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    var jsonResponse = json.decode(response.body);
    var text = jsonResponse;

    escribir(text);
  }
}

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    title: "Calculadora IMC",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _peso = 0.0;
  double _altura = 0.0;
  String _resultado = "";

  TextEditingController _pesoTextEditingController = TextEditingController();
  TextEditingController _alturaTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    atualizar() {
      setState(() {
        _resultado = "";
        _pesoTextEditingController.text = "";
        _alturaTextEditingController.text = "";
      });
    }

    calcular() {
      _peso = double.parse(_pesoTextEditingController.text);
      _altura = double.parse(_alturaTextEditingController.text);

      double imc = _peso / (_altura * _altura);
      String resultado = "Obesidade Grau III (mórbida)";

      print(imc < 40);

      if (imc < 16.0) {
        resultado = "Magreza grave";
      } else if (imc < 17.0) {
        resultado = "Magreza moderada";
      } else if (imc < 18.5) {
        resultado = "Magreza leve";
      } else if (imc < 25.0) {
        resultado = "Saudável";
      } else if (imc < 30.0) {
        resultado = "Sobrepeso";
      } else if (imc < 35.0) {
        resultado = "Obesidade Grau I";
      } else if (imc < 40.0) {
        resultado = "Obesidade Grau II (severa)";
      }

      setState(() {
        _resultado = resultado;
      });
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Calculadora IMC"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: atualizar,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Peso (Kilos)"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: _pesoTextEditingController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Altura (Metros)"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: _alturaTextEditingController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: RaisedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.black,
                  onPressed: calcular,
                ),
              ),
              Text("$_resultado")
            ],
          ),
        ));
  }
}

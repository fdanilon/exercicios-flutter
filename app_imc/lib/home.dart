import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String infoResultado = '';
  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);

      double imc = peso / (altura * altura);
      String resultado = imc.toStringAsPrecision(3);
      if (imc >= 40) {
        infoResultado =
            'Seu IMC é $resultado e você posssui Obesidade Grau III';
      } else if (imc >= 35 && imc <= 39.9) {
        infoResultado = 'Seu IMC é $resultado e você posssui Obesidade Grau II';
      } else if (imc >= 30 && imc <= 34.9) {
        infoResultado = 'Seu IMC é $resultado e você posssui Obesidade Grau I';
      } else if (imc >= 25 && imc <= 29.9) {
        infoResultado = 'Seu IMC é $resultado e você está no Sobrepeso';
      } else if (imc >= 18.5 && imc <= 24.9) {
        infoResultado = 'Seu IMC é $resultado e você está no peso normal';
      } else if (imc < 18.5) {
        infoResultado = 'Seu IMC é $resultado e você está abaixo do peso';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _app_bar(),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _body() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _image(),
          _campo01(),
          _campo02(),
          _botao(),
          _textResult(),
        ]);
  }

  // ignore: non_constant_identifier_names
  _app_bar() {
    return AppBar(
      title: Text("Cálculo do IMC"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  _campo01() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Peso",
        labelStyle: TextStyle(color: Colors.black),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
      ),
      controller: pesoController,
    );
  }

  _campo02() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Altura",
        labelStyle: TextStyle(color: Colors.black),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
      ),
      controller: alturaController,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcular,
          child: Text(
            "Verificar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          color: Colors.black,
        ),
      ),
    );
  }

  _textResult() {
    return Text(
      infoResultado,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontSize: 25.0,
      ),
    );
  }

  _image() {
    return Image.network(
      'https://m.media-amazon.com/images/I/51rdzH6x1HL._AC_SX425_.jpg',
      fit: BoxFit.fitWidth,
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

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
      int numero = new Random().nextInt(10);
      infoResultado = '$numero';
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
          _botao(),
          _textResult(),
        ]);
  }

  // ignore: non_constant_identifier_names
  _app_bar() {
    return AppBar(
      title: Text("Jogo do Nº Aleatório"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  _campo01() {
    return Text(
      'Pense em um nº de 0 a 10',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
      ),
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
            "Descobrir",
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
        color: Colors.black,
        fontSize: 25.0,
      ),
    );
  }

  _image() {
    return Image.network(
      'https://www.selecoes.com.br/wp-content/uploads/2018/12/CHARADA-760x450.jpg',
      fit: BoxFit.fitWidth,
    );
  }
}

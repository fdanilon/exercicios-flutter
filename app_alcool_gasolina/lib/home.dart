import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController alcoolController = TextEditingController();
  String infoResultado = '';
  void _calcular() {
    setState(() {
      double gasolina = double.parse(gasolinaController.text);
      double alcool = double.parse(alcoolController.text);

      double aux = alcool / gasolina;

      if (aux >= 0.7) {
        infoResultado = 'É melhor utilizar gasolina!';
      } else if (aux <= 0.7) {
        infoResultado = 'É melhor utilizar alcool!';
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
          _campo02(),
          _campo01(),
          _botao(),
          _textResult(),
        ]);
  }

  // ignore: non_constant_identifier_names
  _app_bar() {
    return AppBar(
      title: Text("Alcool ou Gasolina?"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  _campo01() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Preço da gasolina:",
        labelStyle: TextStyle(color: Colors.black),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
      ),
      controller: gasolinaController,
    );
  }

  _campo02() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Preço do álcool:",
        labelStyle: TextStyle(color: Colors.black),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
      ),
      controller: alcoolController,
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
      'https://st2.depositphotos.com/1911991/5684/i/600/depositphotos_56846675-stock-photo-yellow-fuel-pump.jpg',
      fit: BoxFit.fitWidth,
    );
  }
}

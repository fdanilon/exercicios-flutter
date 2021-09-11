import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  int numPessoa = 0;

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
          _textResult(),
          _botao_soma(),
          _botao_sub(),
        ]);
  }

  _app_bar() {
    return AppBar(
      title: Text("Contador de Pessoas"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  void _calcMais() {
    setState(() {
      numPessoa++;
      numPessoa.toString();
    });
  }

  void _calcMenos() {
    setState(() {
      numPessoa--;
      numPessoa.toString();
    });
  }

  _botao_soma() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcMais,
          child: Text(
            "+",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          color: Colors.green,
        ),
      ),
    );
  }

  _botao_sub() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcMenos,
          child: Text(
            "-",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          color: Colors.red,
        ),
      ),
    );
  }

  _textResult() {
    return Text(
      "Pessoas no ambiente: " + numPessoa.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontSize: 25.0,
      ),
    );
  }
}

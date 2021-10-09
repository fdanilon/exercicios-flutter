import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _body(),
    );
  }
}

_titulo() {
  return AppBar(
    title: Text("Imagens"),
    centerTitle: true,
    backgroundColor: Colors.black,
  );
}

_body() {
  return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _carrosel(),
        ],
      ));
}

_carrosel() {
  return Container(
    margin: EdgeInsets.only(top: 20, bottom: 20),
    height: 300,
    child: PageView(
      children: <Widget>[
        _anuncio('rock1.jpg', 'Rock 1'),
        _anuncio('rock2.jpg', 'Rock 2'),
        _anuncio('rock3.jpg', 'Rock 3'),
        _anuncio('rock4.jpg', 'Rock 4'),
        _anuncio('rock5.jpg', 'Rock 5'),
      ],
    ),
  );
}

_anuncio(String nomeFoto, String descricao) {
  return SingleChildScrollView(
    child: Container(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_foto(nomeFoto), _texto(descricao)],
      ),
    ),
  );
}

_texto(String description) {
  return Text(
    description,
    style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy),
  );
}

_foto(String nomeFoto) {
  return Image.asset(
    "assets/images/${nomeFoto}",
    height: 150,
    width: 150,
    fit: BoxFit.cover,
  );
}

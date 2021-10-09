import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  String? sexo = "Masculino";
  String? escolaridade = "Fundamental";
  var isBrasileiro = false;
  double limite = 0.0;
  String resultado = "";
  var showInfo = false;

  void _setresultado() {
    setState(() {
      this.showInfo = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abertura de Conta"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo() {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _inputText('Nome', nome),
            _inputText('Idade', idade),
            _dropdownSexo(),
            _dropdownEscolaridade(),
            _switch(),
            _slider(),
            RaisedButton(
              color: Colors.green,
              onPressed: this._setresultado,
              child: Text("Confirmar",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              padding:
                  EdgeInsets.only(top: 15, left: 20, bottom: 15, right: 20),
            ),
            _data(),
          ],
        ));
  }

  _inputText(label, controller) {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 20),
        controller: controller);
  }

  _dropdownSexo() {
    return DropdownButton<String>(
      isExpanded: true,
      value: sexo,
      items: <String>["Masculino", "Feminino", "Prefiro não informar"]
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String? valorSelecionado) {
        setState(() {
          sexo = valorSelecionado;
        });
      },
    );
  }

  _dropdownEscolaridade() {
    return DropdownButton<String>(
      isExpanded: true,
      value: escolaridade,
      items: <String>["Fundamental", "Graduação", "Pós Graduação"]
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String? valorSelecionado) {
        setState(() {
          escolaridade = valorSelecionado;
        });
      },
    );
  }

  _switch() {
    return Container(
        child: Row(
      children: [
        Text("Brasileiro:", style: TextStyle(fontSize: 20)),
        Switch(
          value: isBrasileiro,
          onChanged: (value) {
            setState(() {
              isBrasileiro = value;
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.blue,
        )
      ],
    ));
  }

  _slider() {
    return Container(
        child: Row(
      children: [
        Text("limitee", style: TextStyle(fontSize: 20)),
        Slider(
          value: limite,
          min: 0,
          max: 100,
          divisions: 100,
          label: limite.round().toString(),
          onChanged: (double value) {
            setState(() {
              limite = value;
            });
          },
        )
      ],
    ));
  }

  _data() {
    if (this.showInfo) {
      return Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nome: ${nome.text}", style: TextStyle(fontSize: 20)),
          Text("Idade: ${idade.text}", style: TextStyle(fontSize: 20)),
          Text("Sexo: ${sexo.toString()}", style: TextStyle(fontSize: 20)),
          Text("Escolaridade: ${escolaridade}", style: TextStyle(fontSize: 20)),
          Text("limitee: ${limite}", style: TextStyle(fontSize: 20)),
          Text("Brasileiro: ${isBrasileiro ? "Sim" : "Não"}",
              style: TextStyle(fontSize: 20)),
        ],
      ));
    } else {
      return Container(child: Row());
    }
  }
}

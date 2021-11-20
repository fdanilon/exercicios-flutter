import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valor = TextEditingController();
  String? valueFrom = "Dólar";
  String? valueTo = "Real";

  String? moeda = "";

  double resultado = 0.0;

  void _setResult() {
    setState(() {
      if (valueFrom == "Dólar") {
        if (valueTo == "Euro") {
          moeda = "\$";
          resultado = double.parse(valor.text) * 0.86;
        } else if (valueTo == "Real") {
          moeda = "R\$";
          resultado = double.parse(valor.text) * 5.42;
        } else {
          moeda = "€";
          resultado = double.parse(valor.text);
        }
      } else if (valueFrom == "Real") {
        if (valueTo == "Euro") {
          moeda = "\$";
          resultado = double.parse(valor.text) * 0.16;
        } else if (valueTo == "Dólar") {
          moeda = "\$";
          resultado = double.parse(valor.text) * 0.18;
        } else {
          moeda = "R\$";
          resultado = double.parse(valor.text);
        }
      } else if (valueFrom == "Euro") {
        if (valueTo == "Real") {
          moeda = "R\$";
          resultado = double.parse(valor.text) * 6.28;
        } else if (valueTo == "Dólar") {
          moeda = "\$";
          resultado = double.parse(valor.text) * 1.16;
        } else {
          moeda = "\$";
          resultado = double.parse(valor.text);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
        centerTitle: true,
        backgroundColor: Colors.black87,
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
            _inputText('Valor', valor),
            _dropdownValueFrom(),
            _dropdownValueTo(),
            RaisedButton(
              color: Colors.green,
              onPressed: this._setResult,
              child: Text("Converter",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              padding:
                  EdgeInsets.only(top: 15, left: 20, bottom: 15, right: 20),
            ),
            _result()
          ],
        ));
  }

  _inputText(label, controller) {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.redAccent,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green, fontSize: 20),
        controller: controller);
  }

  _dropdownValueTo() {
    return DropdownButton<String>(
      isExpanded: true,
      value: valueTo,
      items: <String>["Dólar", "Real", "Euro"].map((String value) {
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
          valueTo = valorSelecionado;
        });
      },
    );
  }

  _dropdownValueFrom() {
    return DropdownButton<String>(
      isExpanded: true,
      value: valueFrom,
      items: <String>["Dólar", "Real", "Euro"].map((String value) {
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
          valueFrom = valorSelecionado;
        });
      },
    );
  }

  _result() {
    return Text("Resultado ${moeda} ${resultado.toStringAsPrecision(4)}",
        style: TextStyle(
          fontSize: 20,
        ));
  }
}

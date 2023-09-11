import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerBase = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String _textoResultado = "";
  void _calcular() {
    double? valorBase = double.tryParse(_controllerBase.text);
    double? valorAltura = double.tryParse(_controllerAltura.text);
    double? area;

    if(valorBase == null || valorAltura == null){
      setState(() {
        _textoResultado =
        "Número inválido, digite números maiores que 0 utilizando (.)";
      });
    }else{
      area = valorBase * valorAltura;
      setState(() {
        _textoResultado = area.toString();
        _controllerBase.clear();
        _controllerAltura.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Area do retangulo"),
        backgroundColor :Color.fromARGB(255, 244, 114, 54),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image(
                    image: AssetImage("Imagem/retangulo.png"),
                    width: 300,
                    ),
                ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text(
                      "Saiba a area do retangulo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          color:  Color.fromARGB(255, 244, 114, 54),
                          decoration: TextDecoration.underline),
                    ),
                    )),
                    TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Valor da Base"),
                style: TextStyle(fontSize: 25),
                controller: _controllerBase,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Valor da Altura"),
                style: TextStyle(fontSize: 25),
                controller: _controllerAltura,
              ),
              Padding(
                padding :EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 244, 114, 54),
                  textStyle: TextStyle(
                   fontSize: 25
                  )
                  ),
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
               Center(
                child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 244, 114, 54)),
                  ),
                ),
              )
            ],
           )
         ),
       ),
     );
  }
}

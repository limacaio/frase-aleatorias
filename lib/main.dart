import 'dart:math';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Frases Do Dia",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //declarando array de frase aqui

  final _frases = [
    "Se a dúvida está te desafiando e você não agir, as dúvidas crescerão.",
    "É bom sonhar, mas é melhor sonhar e trabalhar. A fé é poderosa, mas a ação com fé é mais poderosa.",
    "A grande finalidade da vida não é o conhecimento, mas a ação.",
    "Somos o que fazemos repetidamente. Por isso o mérito não está na ação e sim no hábito.",
  ];

  var _fraseGerada = "Clique abaixa para gerar uma nova frase";

  //metodo para gerar a frase

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);
    // print(numeroSorteado);

//para que possa haver alteração na tela e necessario o set state
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frase do Dia"),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
      ),
      body: Center(
        //center centrliza tudo dentro da tela tbm
        child: Container(
          padding: const EdgeInsets.all(14), //espacamento nas laterais
          // width: double.infinity,//centraliza todo o conteudo no container
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png", height: 200, fit: BoxFit.fill),
              SizedBox(
                child: Text(
                  _fraseGerada, //passando a variavel aqui no text
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ElevatedButton(
                  onPressed: _gerarFrase, //chamando o metodo dentro do botão
                  style: ElevatedButton.styleFrom(primary: Colors.blue[300]),
                  child: const Text(
                    "Gerar Nova",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

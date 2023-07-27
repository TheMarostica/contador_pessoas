import 'package:flutter/material.dart';

void main() {

  runApp(const MaterialApp(
    title: "Contador de Pessoas",

    home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _info = "Pode Entrar!";
  String _palavra = "Pessoa";

  // para informar ao flutter que eu modifiquei alguma coisa
  void _changePeople(int delta){
    setState(() { // vai mandar redesenhar a tela
      _people += delta;

      if(_people < 0){
        _info = "Mundo Invertido?!";
      } else if(_people <= 10){
        _info = "Pode Entrar!";
      } else {
        _info = "Lotado!";
      }

      if(_people <= -10){
        _palavra = "Pessoas?";
      }else if(_people < 0){
        _palavra = "Pessoa?";
      } else if(_people < 10){
        _palavra = "Pessoa";
      } else{
        _palavra = "Pessoas";
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Stack( // para colocar a imagem de fundo
      children: [
        Image.asset(
          "images/restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
          opacity: const AlwaysStoppedAnimation(.5),
        ),

        Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            "$_palavra: $_people",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  child: const Text(
                    "+1",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                    )
                  ),

                  onPressed: () {
                    // _people++; // assim não vai atualizar a tela, somente a variável
                    _changePeople(1);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  child: const Text(
                    "-1",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                    )
                  ),

                  onPressed: () {
                    // _people--;
                    _changePeople(-1);
                  },
                ),
              ),
            ],
          ),

          Text(
            _info,
            style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 30.0
            ),
          ),
        ],
      )
      ],
    );
  }
}

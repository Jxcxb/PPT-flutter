import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}


class _JogoState extends State<Jogo> {
  List opcoes = ['pedra', 'papel', 'tesoura'];
  String mensagem = "";
  var placeholderImg = const AssetImage('assets/images/placeholder.png');

  void _jogar(String escPLayer){
    int a = Random().nextInt(opcoes.length);
    String maquina = opcoes[a];
    placeholderImg = AssetImage('assets/images/$maquina.png');

    if (escPLayer == "pedra" && maquina == "tesoura" ||
        escPLayer == "papel" && maquina == "pedra" ||
        escPLayer == "tesoura" && maquina == "papel") {
      setState(() {
        mensagem = "Você venceu!";
      });
    } else if ( escPLayer == maquina ) {
      setState(() {
        mensagem = "Empatou!";
      });
    } else {
      setState(() {
        mensagem = "Você perdeu!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pedra, papel e tesoura'),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: 100,
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: Text('Escolha da máquina:', style: const TextStyle(fontSize: 15)),
          ),
          const SizedBox(
            width: 100,
            height: 30,
          ),
          Image(
            image: placeholderImg,
            width: 80,
          ),
          const SizedBox(
            width: 100,
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: Text('Faça a sua escolha', style: const TextStyle(fontSize: 15))
          ),
          const SizedBox(
            width: 100,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               GestureDetector(
                 onTap: () => _jogar('pedra'),
                 child: Image.asset("assets/images/pedra.png", width: 80,),
               ),
              GestureDetector(
                onTap: () => _jogar('papel'),
                child: Image.asset("assets/images/papel.png", width: 80,),
              ),
              GestureDetector(
                onTap: () => _jogar('tesoura'),
                child: Image.asset("assets/images/tesoura.png", width: 80,),
              ),
          ],
          ),
          SizedBox(height: 32,),
          AutoSizeText(
            '$mensagem',
            style: const TextStyle(fontSize: 15),
            maxLines: 2,),
          const SizedBox(height: 32,),
        ], //children
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perguntas/questionario.dart';
import 'package:perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(
        () {
          _perguntaSelecionada++;
          _pontuacaoTotal += pontuacao;
        },
      );
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Vermelho', 'pontuacao': 6},
        {'texto': 'Branco', 'pontuacao': 4},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 8},
        {'texto': 'Gato', 'pontuacao': 4},
        {'texto': 'Coelho', 'pontuacao': 7},
        {'texto': 'Papagaio', 'pontuacao': 3},
      ]
    },
    {
      'texto': 'Para qual time você torce?',
      'respostas': [
        {'texto': 'Corinthians', 'pontuacao': 10},
        {'texto': 'São Paulo', 'pontuacao': 0},
        {'texto': 'Santos', 'pontuacao': 1},
        {'texto': 'Palmeiras', 'pontuacao': 0},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

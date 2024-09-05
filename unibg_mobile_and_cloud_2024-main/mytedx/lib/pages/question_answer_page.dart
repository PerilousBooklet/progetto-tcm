import 'dart:math';

import 'package:flutter/material.dart';

class QuestionAnswerPage extends StatefulWidget {
  final List<String> qa;
  QuestionAnswerPage({super.key, required this.qa});
  @override
  State<QuestionAnswerPage> createState() => _QuestionAnswerPageState(qa: qa);
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  List<String> qa = [];
  _QuestionAnswerPageState({required this.qa});

  TextEditingController _controllerVero = TextEditingController();
  TextEditingController _controllerFalso = TextEditingController();
  TextEditingController _domandaField = TextEditingController();
  TextEditingController _rispostaController = TextEditingController();
  String rispostaCorretta = "";
  String rispostaUtente = "";
  bool utenteRisposto = false;

  @override
  void initState() {
    final random = Random();
    String element = qa[random.nextInt(qa.length)];
    _controllerVero.text = "Vero (Selezionato)";
    _controllerFalso.text = "Falso";
    _domandaField.text = element.substring(1);
    rispostaCorretta = element.substring(0, 1);
    _rispostaController.text = "Invia";
    super.initState();
  }

  selectTrue() {
    if (utenteRisposto) {
      return;
    }
    _controllerVero.text = "Vero (Selezionato)";
    _controllerFalso.text = "Falso";
    rispostaUtente = "1";
  }

  selectFalse() {
    if (utenteRisposto) {
      return;
    }
    _controllerVero.text = "Vero";
    _controllerFalso.text = "Falso (Selezionato)";
    rispostaUtente = "0";
  }

  selectSend() {
    utenteRisposto = true;
    if (rispostaCorretta == "1") {
      _controllerVero.text = "Vero (Corretta)";
      _controllerFalso.text = "Falso (Errata)";
    } else {
      _controllerVero.text = "Vero (Errata)";
      _controllerFalso.text = "Falso (Corretta)";
    }

    if (rispostaCorretta == rispostaUtente) {
      _rispostaController.text = "Hai risposto correttamente";
    } else {
      _rispostaController.text = "Hai risposto in modo errato";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TedQuiz'),
      ),
      body: Expanded(
          child: ListView(
        children: [
          // Question Text
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          TextField(
            maxLines: 10,
            controller: _domandaField,
            enabled: false,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Domanda"),
            style: const TextStyle(color: Colors.black),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          // Vero
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
              onPressed: () => {selectTrue()},
              child: TextField(
                textAlign: TextAlign.center,
                enabled: false,
                controller: _controllerVero,
                style: const TextStyle(color: Colors.black),
              )),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          // Falso
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => {selectFalse()},
              child: TextField(
                textAlign: TextAlign.center,
                enabled: false,
                style: const TextStyle(color: Colors.black),
                controller: _controllerFalso,
              )),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          // Invia
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () => {selectSend()},
              child: TextField(
                textAlign: TextAlign.center,
                enabled: false,
                style: const TextStyle(color: Colors.black),
                controller: _rispostaController,
              )),
        ],
      )),
    );
  }
}

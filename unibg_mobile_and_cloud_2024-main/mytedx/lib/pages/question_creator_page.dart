import 'package:flutter/material.dart';
import 'package:mytedx/models/ted_repository.dart';

class QuestionCreatorPage extends StatefulWidget {
  final String slug;
  QuestionCreatorPage({super.key, required this.slug});
  @override
  State<QuestionCreatorPage> createState() =>
      _QuestionCreatorPageState(slug: slug);
}

class _QuestionCreatorPageState extends State<QuestionCreatorPage> {
  String slug = "";
  String qa = "";
  _QuestionCreatorPageState({required this.slug});

  @override
  void initState() {
    super.initState();
    _controllerVero.text = "Vero (Selezionato)";
    _controllerFalso.text = "Falso";
    _controllerSend.text = "Invia";
  }

  final _controller = TextEditingController();
  final _controllerVero = TextEditingController();
  final _controllerFalso = TextEditingController();
  final _controllerSend = TextEditingController();

  TedRepository repository = TedRepository();

  goTrue() {
    _controllerVero.text = "Vero (Selezionato)";
    _controllerFalso.text = "Falso";
    qa = "1${_controller.text}";
  }

  goFalse() {
    _controllerVero.text = "Vero";
    _controllerFalso.text = "Falso (Selezionato)";
    qa = "0${_controller.text}";
  }

  goSend() {
    repository.sendQA(slug, qa);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TedQuiz'),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              TextField(
                maxLines: 20,
                controller: _controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Domanda',
                    hintText: 'Domanda'),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen),
                  onPressed: () => {goTrue()},
                  child: TextField(
                    textAlign: TextAlign.center,
                    enabled: false,
                    controller: _controllerVero,
                    style: const TextStyle(color: Colors.black),
                  )),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => {goFalse()},
                  child: TextField(
                    textAlign: TextAlign.center,
                    enabled: false,
                    controller: _controllerFalso,
                    style: const TextStyle(color: Colors.black),
                  )),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue),
                  onPressed: () => {goSend()},
                  child: TextField(
                    textAlign: TextAlign.center,
                    enabled: false,
                    controller: _controllerSend,
                    style: const TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ));
  }
}

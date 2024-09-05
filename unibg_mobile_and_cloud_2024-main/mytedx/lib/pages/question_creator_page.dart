import 'package:flutter/material.dart';

class QuestionCreatorPage extends StatefulWidget {
  @override
  State<QuestionCreatorPage> createState() => _QuestionCreatorPageState();
}

class _QuestionCreatorPageState extends State<QuestionCreatorPage> {
  @override
  void initState() {
    super.initState();
    _controllerVero.text = "Vero (Selezionato)";
    _controllerFalso.text = "Falso";
  }

  final _controller = TextEditingController();

  final _controllerVero = TextEditingController();

  final _controllerFalso = TextEditingController();

  bool risposta = true;

  goTrue() {}

  goFalse() {}

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
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () => {goTrue()},
                  child: TextField(
                    readOnly: true,
                    controller: _controllerVero,
                  )),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => {goFalse()},
                  child: TextField(
                    readOnly: true,
                    controller: _controllerFalso,
                  ))
            ],
          ),
        ));
  }
}

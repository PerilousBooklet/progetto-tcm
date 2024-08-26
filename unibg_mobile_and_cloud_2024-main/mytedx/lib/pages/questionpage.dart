import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});
  
  final String title = "Question Page";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
          child: Column(
          children: [
            // Input Text Field
            Container(
              //decoration: BoxDecoration(
              //  border: Border.all(color: Colors.tealAccent, width: 1.0),
              //),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 400.0,
                  height: 80.0,
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              )
            ),
            // Choice Options
            // TODO: creazione domanda, input field (bello grande, rettangolare), ci sono due tasti vero/falso (verde/rosso), di base il vero e' la risposta corretta, per cambiare il tasto corrisp. alla risposta si clicca (diventa verde e l'altro diventa rosso)
            // TODO: risposta: due tasti (vero/falso)
            // TODO: due bottoni, Salva e Elimina
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'True',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'False',
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ],
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

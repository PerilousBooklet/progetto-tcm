import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key});
  
  final String title = "Question Page";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            // Input Text Field
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.tealAccent, width: 5.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 100.0,
                  height: 60.0,
                  child: TextField(
                    // ...
                  ),
                ),
              )
            ),
            // Choice Options
            // TODO: creazione domanda, input field (belo grande, rettangolare), ci sono due tasti vero/falso (verde/rosso), di base il vero e' la risposta corretta, per cambiare il tasto corrisp. alla risposta si clicca (diventa verde e l'altro diventa rosso)
            // TODO: risposta: due tasti (vero/falso)
            // TODO: due bottoni, Salva e Elimina
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.tealAccent, width: 5.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

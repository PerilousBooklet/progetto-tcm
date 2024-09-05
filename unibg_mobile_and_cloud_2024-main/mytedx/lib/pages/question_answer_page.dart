import 'package:flutter/material.dart';

class QuestionAnswerPage extends StatelessWidget {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              maxLines: 10,
              enabled: false,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          // Answer Buttons
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // True
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                    onPressed: () => {},
                    child: TextField(
                      textAlign: TextAlign.center,
                      enabled: false,
                      style: const TextStyle(color: Colors.black),
                    )
                  ),
                ),
                // False
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => {},
                    child: TextField(
                      textAlign: TextAlign.center,
                      enabled: false,
                      style: const TextStyle(color: Colors.black),
                    )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

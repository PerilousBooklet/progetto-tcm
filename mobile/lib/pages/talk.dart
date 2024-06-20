import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Talk extends StatelessWidget {
  const Talk({super.key});
  
  final String title = "Talk Page";
  
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
              Container(padding: const EdgeInsets.all(10.0), child: const Text("Do you want to prepare or answer a quiz?")),
              // Question Page
              TextButton(
                child: const Text('Prepare a Quiz'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Question()));
                },
              ),
              // Answer Page
              TextButton(
                child: const Text('Answer a Quiz'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Answer()));
                },
              ),
            ],
          ),
        )
    );
  }
}

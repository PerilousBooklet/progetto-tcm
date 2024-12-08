import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage({super.key});
  
  final String title = "Answer Page";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'placeholder text', // TODO: Here goes the content of the question text variable
                  style: TextStyle(fontSize: 23),
                  ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'True',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'False',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

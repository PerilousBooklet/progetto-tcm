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
        
      ),
    );
  }
}

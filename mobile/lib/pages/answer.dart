import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({super.key});
  
  final String title = "Answer Page";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        
      ),
    );
  }
}

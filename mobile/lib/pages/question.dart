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
      body: const Center(
        child: Column(
          children: [
            SizedBox(
              width: 100.0,
              child: TextField(
                
              ),
            )
          ],
        ),
      ),
    );
  }
}

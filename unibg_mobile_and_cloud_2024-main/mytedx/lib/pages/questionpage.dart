import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});
  
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final String title = "Question Page";
  bool isPressed = false;
  
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
            Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: 400.0,
                  height: 80.0,
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
            // True/False Buttons
            //Center(
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                          
                        });
                      },
                      style: TextButton.styleFrom(backgroundColor: isPressed ? Colors.teal : Colors.transparent),
                      child: const Text(
                        'True',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(backgroundColor: isPressed ? Colors.transparent : Colors.teal),
                      child: const Text(
                        'False',
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ],
                ),
              ),
            //),
            // Save/Delete Buttons
            //Center(
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    children: [
                      TextButton(
                        child: const Text('Save', style: TextStyle(fontSize: 25),),
                        onPressed: null,
                      ),
                      TextButton(
                        child: const Text('Delete', style: TextStyle(fontSize: 25),),
                        onPressed: null,
                      )
                    ],
                  ),
                )
              //),
          ],
        ),
        ),
      ),
    );
  }
}

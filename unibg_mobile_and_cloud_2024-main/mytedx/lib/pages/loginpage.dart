import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 150.0,
            width: 190.0,
            padding: EdgeInsets.only(top: 0),
            child: const Column(
              children: [
                // Username Field
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        hintText: 'Enter name'),
                  ),
                ),
                // TODO: add navigation to main page after pressing login button
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

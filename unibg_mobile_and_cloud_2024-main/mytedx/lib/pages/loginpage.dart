import 'package:flutter/material.dart';
import '../main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
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
                    hintText: 'Enter name'
                  ),
                ),
              ),
              // Password Field
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure password'
                  ),
                ),
              ),
              // TODO: add navigation to main page after pressing login button
            ],
          ),
        ),
      ),
    );
  }
}

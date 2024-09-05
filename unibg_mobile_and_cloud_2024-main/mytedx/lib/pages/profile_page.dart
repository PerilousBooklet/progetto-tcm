import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {
  bool _isTextFieldEnabled = true;
  final _controller = TextEditingController();

  loginPress() {
    setState(() {
      if (_controller.text != "") {
        _isTextFieldEnabled = false;
      }
    });
  }

  logoutPress() {
    setState(() {
      _controller.text = "";
      _isTextFieldEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 150.0,
            width: MediaQuery.of(context).size.width - 20,
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: [
                // Username Field
                Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      enabled: _isTextFieldEnabled,
                      controller: _controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'Enter name'),
                    )),
                Row(
                  children: [
                    OutlinedButton(
                        onPressed: loginPress, child: const Text("Login")),
                    const Padding(padding: EdgeInsets.all(10)),
                    OutlinedButton(
                        onPressed: logoutPress, child: const Text("Logout"))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

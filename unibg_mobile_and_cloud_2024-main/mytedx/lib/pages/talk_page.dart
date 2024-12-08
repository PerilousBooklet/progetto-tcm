import 'package:flutter/material.dart';
import 'package:mytedx/ui/talk_single.dart';

class TalkPage extends StatelessWidget {
  TalkPage({super.key, required this.slug});

  final String slug;

  gotoMainPage(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TedQuiz'),
        ),
        body: Expanded(
          child: ListView(
            children: [
              TalkSingle(
                slug: slug,
              )
            ],
          ),
        ));
  }
}

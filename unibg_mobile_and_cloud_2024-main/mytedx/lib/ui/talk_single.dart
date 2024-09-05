import 'package:flutter/material.dart';
import 'package:mytedx/models/talk_byslug.dart';
import 'package:mytedx/models/ted_repository.dart';
import 'package:mytedx/pages/question_answer_page.dart';
import 'package:mytedx/pages/question_creator_page.dart';

class TalkSingle extends StatelessWidget {
  TalkSingle({super.key, required this.slug});

  final String slug;

  goToQuestionAnswer(BuildContext context, List<String> qaList) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuestionAnswerPage()));
  }

  goToQuestionCreator(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => QuestionCreatorPage()));
  }

  @override
  Widget build(BuildContext context) {
    TedRepository tedRepo = TedRepository();

    return FutureBuilder<TalkBySlug>(
      future: tedRepo.getSingleTalk(slug),
      builder: (_, AsyncSnapshot<TalkBySlug> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      snapshot.data!.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 30.0),
                    ),
                    Image.network(snapshot.data!.img_url),
                    Text("Durata: ${snapshot.data!.duration}s"),
                    Text("Speakers: ${snapshot.data!.speakers}"),
                    Text(
                      snapshot.data!.description,
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: const Text("Rispondi alle domande"),
                          onPressed: () {
                            goToQuestionAnswer(context, snapshot.data!.QA);
                          },
                        ),
                        TextButton(
                          child: const Text("Crea delle domande"),
                          onPressed: () {
                            goToQuestionCreator(context);
                          },
                        ),
                      ],
                    )
                  ],
                ));
          }
        }
        return const Text("Attendi. Download dati in corso");
      },
    );
  }
}

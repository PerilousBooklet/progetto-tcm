import 'package:flutter/material.dart';
import 'package:mytedx/models/talk_mainpage.dart';
import 'package:mytedx/ted_repository.dart';
import 'package:mytedx/pages/questionpage.dart';

// class TalksList extends StatefulWidget {
//   const TalksList({super.key});
//   @override
//   State<TalksList> createState() => _TalkListState();
// }

class TalksList extends StatelessWidget {
  const TalksList({super.key});

  gotoDomande(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const QuestionPage()));
  }

  @override
  Widget build(BuildContext context) {
    // ?
    TedRepository tedRepo = TedRepository();

    return FutureBuilder<List<TalkMainPage>>(
      future: tedRepo.getTalkList(),
      builder: (_, AsyncSnapshot<List<TalkMainPage>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            onTap: () => gotoDomande(context),
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(snapshot.data![index].description),
                            trailing: InkWell(
                              child:
                                  Image.network(snapshot.data![index].img_url),
                            ),
                          ),
                        )));
          }
        }
        return const Text("Attendi. Download dati in corso");
      },
    );
  }
}

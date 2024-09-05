import 'package:flutter/material.dart';
import 'package:mytedx/models/talk_mainpage.dart';
import 'package:mytedx/models/ted_repository.dart';
import 'package:mytedx/pages/talk_page.dart';

class TalksList extends StatelessWidget {
  const TalksList({super.key});

  gotoDomande(BuildContext context, String slug) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TalkPage(
                  slug: slug,
                )));
  }

  @override
  Widget build(BuildContext context) {
    // ?
    TedRepository tedRepo = TedRepository();

    return FutureBuilder<List<TalkMainPage>>(
      future: tedRepo.getTalkList(),
      builder: (_, AsyncSnapshot<List<TalkMainPage>> snapshot) {
        print(snapshot.connectionState);
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
                            onTap: () => gotoDomande(
                                context, snapshot.data![index].slug),
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(snapshot.data![index].description),
                            trailing: InkWell(
                              child:
                                  Image.network(snapshot.data![index].img_url),
                            ),
                          ),
                        )));
          } else {
            return const Text("Nessun talk trovato");
          }
        }
        return const Text("Attendi. Download dati in corso");
      },
    );
  }
}

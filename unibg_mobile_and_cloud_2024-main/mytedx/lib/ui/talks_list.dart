import 'package:flutter/material.dart';
import 'package:mytedx/models/talk_mainpage.dart';
import 'package:mytedx/ted_repository.dart';

// class TalksList extends StatefulWidget {
//   const TalksList({super.key});
//   @override
//   State<TalksList> createState() => _TalkListState();
// }

class TalksList extends StatelessWidget {
  TalksList({super.key});

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
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(snapshot.data![index].description),
                            trailing: InkWell(
                              onTap: () {},
                              child: Container(
                                child: Image.network(
                                    snapshot.data![index].img_url),
                              ),
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

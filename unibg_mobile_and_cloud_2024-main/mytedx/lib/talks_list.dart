import 'package:flutter/material.dart';
import 'models/talk_mainpage.dart';
import 'ted_repository.dart';

class TalksList extends StatefulWidget {
  const TalksList({super.key});
  @override
  State<TalksList> createState() => _TalkListState();
}

class _TalkListState extends State<TalksList>{
  Widget build(BuildContext context) {
    // ?
    TedRepository ted_repo = TedRepository();
    Future<List<TalkMainPage>>talks_list_future = ted_repo.getTalkList();
    List<TalkMainPage> talks_list = List.empty();
    talks_list_future.then((result){
      setState(() {
        talks_list = result;
      });
    });
    
    // ?
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: talks_list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          //child: Center(child: Text('Entry ${talks_list[index]}')),
          // Talk entry
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(talks_list[index].img_url),
                  Column(
                    children: [
                      Text(talks_list[index].title, style: TextStyle(fontSize: 23),),
                      Text(talks_list[index].description, style: TextStyle(fontSize: 20),),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

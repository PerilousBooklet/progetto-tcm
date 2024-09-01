import 'package:flutter/material.dart';
import 'models/talk_mainpage.dart';
import 'ted_repository.dart';

// class TalksList extends StatefulWidget {
//   const TalksList({super.key});
//   @override
//   State<TalksList> createState() => _TalkListState();
// }

class TalksList extends StatelessWidget{
  Widget build(BuildContext context) {
    // ?
    // TedRepository ted_repo = TedRepository();
    // Future<List<TalkMainPage>>talks_list_future = ted_repo.getTalkList();
    // List<TalkMainPage> talks_list = List.empty();
    // talks_list_future.then((result){
    //   setState(() {
    //     talks_list = result;
    //     print(result);
    //   });
    // });
    
    // ?
    // return ListView.builder(
    //   padding: const EdgeInsets.all(8),
    //   itemCount: talks_list.length,
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       height: 50,
    //       // Talk entry
    //       child: Center(
    //         child: Padding(
    //           padding: EdgeInsets.all(10),
    //           child: Row(
    //             children: [
    //               Image.network(talks_list[index].img_url),
    //               Column(
    //                 children: [
    //                   Text(talks_list[index].title, style: TextStyle(fontSize: 23),),
    //                   Text(talks_list[index].description, style: TextStyle(fontSize: 20),),
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   }
    // );
    // ?
    return FutureBuilder<List<TalkMainPage>> (
      future: TedRepository.getTalkList(),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mytedx/models/talk_byslug.dart';
import 'package:mytedx/models/talk_mainpage.dart';

class TedRepository {
  TedRepository();

  Future<List<TalkMainPage>> getTalkList() async {
    var response = await http.get(
      Uri.parse(
          "https://8hqpqi3mm7.execute-api.us-east-1.amazonaws.com/default/pg9-prog-lambda-GetAllTalks"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final responseBodyParsed = json.decode(response.body);

    return responseBodyParsed
        .map<TalkMainPage>((json) => TalkMainPage.fromJSON(json))
        .toList();
  }

  Future<TalkBySlug> getSingleTalk(String slug) async {
    var response = await http.post(
        Uri.parse(
            "https://kx7pqnr9eh.execute-api.us-east-1.amazonaws.com/default/pg9-prog-lambda-GetTalkBySlug"),
        headers: {'Content-Type': "application/json"},
        body: json.encode({'slug': slug}));

    TalkBySlug talkBySlug = TalkBySlug.fromJSON(json.decode(response.body));

    if (talkBySlug.QA.isEmpty) {
      talkBySlug.QA = [""];
    }

    return talkBySlug;
  }

  Future<String> sendQA(String slug, String qa) async {
    var response = await http.post(
        Uri.parse(
            "https://zbjyl85kp6.execute-api.us-east-1.amazonaws.com/default/pg9-prog-lambda-AddQABySlug"),
        headers: {'Content-Type': "application/json"},
        body: json.encode({'slug': slug, 'question': qa}));

    return response.body;
  }
}

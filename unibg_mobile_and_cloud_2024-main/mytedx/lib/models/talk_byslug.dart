class TalkBySlug {
  String id = "";
  String slug = "";
  String speakers = "";
  String title = "";
  String url = "";
  String description = "";
  String duration = "0";
  String publishedAt = "";
  List<String> tags = [""];
  String img_url = "";
  List<String> related_videos = [""];
  String views = "0";
  List<String> QA = [""];

  TalkBySlug.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['_id'];
    slug = jsonMap['slug'];
    speakers = jsonMap['speakers'];
    title = jsonMap['title'];
    url = jsonMap['url'];
    description = jsonMap['description'];
    duration = jsonMap['duration'];
    publishedAt = jsonMap['publishedAt'];
    if (jsonMap['QA'] == null) {
      tags = [];
    } else {
      tags = arrayDecoder(jsonMap[""]);
    }

    img_url = jsonMap['img_url'];
    // related_videos = arrayDecoder(jsonMap[""]);
    views = jsonMap['views'];
    if (jsonMap['QA'] == null) {
      QA = [];
    } else {
      QA = arrayDecoder(jsonMap['QA']);
    }
  }

  @override
  String toString() {
    return "$id, $slug, $speakers, $title, $url, $description, $duration, $publishedAt, $tags, $img_url, $related_videos, $views, $QA";
  }

  List<String> arrayDecoder(List<dynamic> QAMap) {
    List<String> finalMap = [];

    for (var element in QAMap) {
      finalMap.add(element);
    }
    return finalMap;
  }
}

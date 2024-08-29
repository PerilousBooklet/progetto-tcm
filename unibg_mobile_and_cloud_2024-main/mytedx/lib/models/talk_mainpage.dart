class TalkMainPage {
  final String slug;
  final String title;
  final String description;
  final String img_url;

  TalkMainPage.fromJSON(Map<String, dynamic> jsonMap) :
    slug = jsonMap['slug'],
    title = jsonMap['title'],
    description = (jsonMap['description'] ?? ""),
    img_url = (jsonMap['img_url'] ?? "");

}

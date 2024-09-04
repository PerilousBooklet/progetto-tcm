class TalkMainPage {
  final String slug;
  final String title;
  final String description;
  final String img_url;

  TalkMainPage.fromJSON(Map<String, dynamic> jsonMap)
      : slug = jsonMap['slug'],
        title = jsonMap['title'],
        description = (jsonMap['description'] ?? ""),
        img_url = (jsonMap['img_url'] ?? "");

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
        "description": description,
        "img_url": img_url,
      };

  @override
  String toString() {
    // TODO: implement toString
    String dati = "$slug | $title | $description | $img_url";
    return dati;
  }
}

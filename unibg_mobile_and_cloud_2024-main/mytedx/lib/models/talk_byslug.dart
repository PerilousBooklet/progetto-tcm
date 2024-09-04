class TalkBySlug {
  final String id;
  final String slug;
  final String speakers;
  final String title;
  final String url;
  final String description;
  final String duration;
  final String publishedAt;
  final String tags;
  final String img_url;
  final String related_videos;
  final String views;
  final String QA;

  TalkBySlug.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['_id'],
        slug = jsonMap['slug'],
        speakers = jsonMap['speakers'],
        title = jsonMap['title'],
        url = jsonMap['url'],
        description = jsonMap['description'],
        duration = jsonMap['duration'],
        publishedAt = jsonMap['publishedAt'],
        tags = jsonMap['tags'],
        img_url = jsonMap['img_url'],
        related_videos = jsonMap['related_videos'],
        views = jsonMap['views'],
        QA = jsonMap['QA'];
}

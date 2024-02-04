class NewsArticle {
  final String headline;
  final String url;

  NewsArticle({required this.headline, required this.url});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      headline: json['title'],
      url: json['url'],
    );
  }
}

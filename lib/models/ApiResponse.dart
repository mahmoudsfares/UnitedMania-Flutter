class ApiResponseBody {

  static const String API_URL =
      "https://newsapi.org/v2/everything?q=manchester%20united%7Cman%20utd%7Cman%20united%7Cmanchester%20utd&apiKey=47ba773d0f1147438a3d6244bc7f1e5e&sortBy=publishedAt&language=en&fbclid=IwAR215STnwzrUekxittTkbK3Vn8INjsOE0Zl28uctn2lDwpOelkKVurJvWwc";

  String status;
  int totalResults;
  List<Article> articles;

  ApiResponseBody(this.status, this.totalResults, this.articles);

  factory ApiResponseBody.fromJson(Map<String, dynamic> json) {
    return ApiResponseBody(json['status'], json['totalResults'],
        List<Article>.from(json['articles'].map((x) => Article.fromJson(x))));
  }
}

class Article {

  Source source;
  String title;
  String content;
  String url;
  String image;

  Article(this.source, this.title, this.content, this.url, this.image);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        Source.fromJson(json['source']),
        json['title'],
        json['content'],
        json['url'],
        json['urlToImage'] ?? 'assets/placeholder.jpg');
  }
}

class Source {

  String name;

  Source(this.name);

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(json['name']);
  }
}

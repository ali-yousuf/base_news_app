import 'dart:convert';
import 'package:base_news_app/core/network/base_api_response.dart';

class NewsResponse extends BaseApiResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const NewsResponse({this.status, this.totalResults, this.articles});

  NewsResponse copyWith(
      {String? status, int? totalResults, List<Article>? articles}) {
    return NewsResponse(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles);
  }

  @override
  List<Object?> get props => [status, totalResults, articles];

  @override
  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((e) => e.toMap()).toList()
    };
  }

  factory NewsResponse.fromMap(Map<String, dynamic> map) {
    return NewsResponse(
        status: map['status'] ?? '',
        totalResults: map['totalResults'] ?? '',
        articles: List<Article>.from(
            map['articles']?.map((x) => Article.fromMap(x))));
  }

  String toJson() => json.encode(toMap());

  factory NewsResponse.fromJson(String source) =>
      NewsResponse.fromMap(json.decode(source));
}

class Article extends BaseApiResponse {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Article copyWith(
      {Source? source,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content}) {
    return Article(
        source: source ?? this.source,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content);
  }

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];

  @override
  Map<String, dynamic> toMap() {
    return {
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
        source: map['source'] == null ? null : Source.fromMap(map['source']),
        author: map['author'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        url: map['url'] ?? '',
        urlToImage: map['urlToImage'] ?? '',
        publishedAt: map['publishedAt'] ?? '',
        content: map['content'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article{source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content}';
  }
}

class Source extends BaseApiResponse {
  final int id;
  final String name;

  const Source({required this.id, required this.name});

  Source copyWith({dynamic id, String? name}) {
    return Source(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  List<Object?> get props => [id, name];

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(id: map['id'] ?? 0, name: map['name'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Source{id: $id, name: $name}';
  }
}

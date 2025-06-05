// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsData {
  final String title;
  final String? imageUrl;
  final String description;
  final String pubDate;
  final String link;
  NewsData({
    required this.title,
    this.imageUrl,
    required this.description,
    required this.pubDate,
    required this.link,
  });

  NewsData copyWith({
    String? title,
    String? imageUrl,
    String? description,
    String? pubDate,
    String? link,
  }) {
    return NewsData(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      pubDate: pubDate ?? this.pubDate,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'pubDate': pubDate,
      'link': link,
    };
  }

  factory NewsData.fromMap(Map<String, dynamic> map) {
    return NewsData(
      title: map['title'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      pubDate: map['pubDate'],
      link: map['link'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsData.fromJson(String source) =>
      NewsData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsData(title: $title, imageUrl: $imageUrl, description: $description, pubDate: $pubDate, link: $link)';
  }

  @override
  bool operator ==(covariant NewsData other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.pubDate == pubDate &&
        other.link == link;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        pubDate.hashCode ^
        link.hashCode;
  }
}
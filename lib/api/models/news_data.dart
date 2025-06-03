// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsData {
  final String title;
  final String? imageUrl;
  final String description;
  final String pubDate;
  NewsData({
    required this.title,
    this.imageUrl,
    required this.description,
    required this.pubDate,
  });

  NewsData copyWith({
    String? title,
    String? imageUrl,
    String? description,
    String? pubDate,
  }) {
    return NewsData(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      pubDate: pubDate ?? this.pubDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image_Url': imageUrl,
      'description': description,
      'pubDate': pubDate,
    };
  }

  factory NewsData.fromMap(Map<String, dynamic> map) {
    return NewsData(
      title: map['title'],
      imageUrl: map['image_Url'],
      description: map['description'],
      pubDate: map['pubDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsData.fromJson(String source) =>
      NewsData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsData(title: $title, imageUrl: $imageUrl, description: $description, pubDate: $pubDate)';
  }

  @override
  bool operator ==(covariant NewsData other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.pubDate == pubDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        pubDate.hashCode;
  }
}
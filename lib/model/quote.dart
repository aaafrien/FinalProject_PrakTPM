import 'dart:convert';

List<Quotes> quotesFromJson(String str) =>
    List<Quotes>.from(json.decode(str).map((x) => Quotes.fromJson(x)));

String quotesToJson(List<Quotes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quotes {
  int id;
  bool dialogue;
  bool? private;
  List<String> tags;
  String url;
  int favoritesCount;
  int upvotesCount;
  int downvotesCount;
  String? author;
  String? authorPermalink;
  String? body;
  String? source;

  Quotes({
    required this.id,
    required this.dialogue,
    this.private,
    required this.tags,
    required this.url,
    required this.favoritesCount,
    required this.upvotesCount,
    required this.downvotesCount,
    this.author,
    this.authorPermalink,
    this.body,
    this.source,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        id: json["id"],
        dialogue: json["dialogue"],
        private: json["private"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        url: json["url"],
        favoritesCount: json["favorites_count"],
        upvotesCount: json["upvotes_count"],
        downvotesCount: json["downvotes_count"],
        author: json["author"],
        authorPermalink: json["author_permalink"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dialogue": dialogue,
        "private": private,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "url": url,
        "favorites_count": favoritesCount,
        "upvotes_count": upvotesCount,
        "downvotes_count": downvotesCount,
        "author": author,
        "author_permalink": authorPermalink,
        "body": body,
      };
}

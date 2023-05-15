import 'dart:convert';

Quotes quotesFromJson(String str) => Quotes.fromJson(json.decode(str));

class Quotes {
  String? id;
  String? author;
  String? body;

  Quotes({
    required this.id,
    required this.author,
    required this.body,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        id: json["id"] == null ? "id" : json["id"],
        author: json["author"] == null ? "author" : json["author"],
        body: json["body"] == null ? "body" : json["body"],
      );
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Quotes {
  int? id;
  String? quote;
  String? author;
  String? category;

  Quotes({this.id, this.quote, this.author, this.category});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      id: json['id'] as int,
      quote: json['quote'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
    );
  }

  List<Quotes> parseQuotes(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Quotes>((json) => Quotes.fromJson(json)).toList();
  }

  Future<List<Quotes>> fetchQuotes(http.Client client) async {
    final urlApi = "https://api.api-ninjas.com/v1/quotes?category={}";
    final response = await client.get(urlApi);
    if (response.statusCode == 200) {
      return compute(parseQuotes, response.body);
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}

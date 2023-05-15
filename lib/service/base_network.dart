import 'dart:convert';
import 'package:finalproject/model/quote.dart';
import 'package:http/http.dart' as http;

class BaseNetwork {
  Future<List<Quotes?>> fetchQuotes(String name) async {
    var url = Uri.parse('https://favqs.com/api/quotes/');
    var response = await http.get(url,
        headers: {'Authorization': 'Token cbefbc35153023a24355ad07559df86d'});

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Quotes?> items = [];
    for (var i in data['quotes']) {
      if (i != null) {
        items.add(Quotes.fromJson(i));
      }
    }

    print(response);
    return items;
  }
}

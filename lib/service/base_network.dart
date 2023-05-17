import 'dart:convert';
import 'package:finalproject/model/quote.dart';
import 'package:http/http.dart' as http;

class BaseNetwork {
  Future<List<Quotes?>> fetchQuotes() async {
    var url = Uri.parse("https://favqs.com/api/quotes");
    var response = await http.get(url,
        headers: {'Authorization': 'Token cbefbc35153023a24355ad07559df86d'});

    var data = await jsonDecode(utf8.decode(response.bodyBytes))['quotes'];

    List<Quotes?> items = [];
    if (data != null) {
      // print(data);
      for (var i in data) {
        if (i != null && i['lines'] == null) {
          items.add(Quotes.fromJson(i));
        }
      }
    }

    print(response);
    return items;
  }

  Future<List<Quotes?>> fetchQuotesTag(String filter) async {
    var url = Uri.parse("https://favqs.com/api/quotes?filter=$filter&type=tag");
    var response = await http.get(url,
        headers: {'Authorization': 'Token cbefbc35153023a24355ad07559df86d'});

    var data = await jsonDecode(utf8.decode(response.bodyBytes))['quotes'];
    var checkQuotes =
        await jsonDecode(utf8.decode(response.bodyBytes))['quotes'][0]['body'];

    List<Quotes?> items = [];
    print(checkQuotes);
    if (data != null && checkQuotes != "No quotes found") {
      for (var i in data) {
        if (i != null && i['lines'] == null) {
          items.add(Quotes.fromJson(i));
        }
      }
    }

    print(response);
    return items;
  }
}

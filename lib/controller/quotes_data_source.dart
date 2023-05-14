import 'package:finalproject/service/base_network.dart';

class QuotesDataSource {
  static QuotesDataSource instance = QuotesDataSource();
  Future<Map<String, dynamic>> loadQuotes(String text) {
    return BaseNetwork.get(text);
  }
}

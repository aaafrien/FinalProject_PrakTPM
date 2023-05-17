import 'package:finalproject/model/quotes_lib.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static String quote = 'quote_box';

  static Box<Quote> getQuote()=> Hive.box<Quote>(quote);
}

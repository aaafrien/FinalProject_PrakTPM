import 'package:hive/hive.dart';

part 'quotes_lib.g.dart'; // generate file using build_runner

@HiveType(typeId: 0)
class Quote extends HiveObject {
  @HiveField(0)
  final String author;

  @HiveField(1)
  final String quotes;
  
  @HiveField(2)
  final DateTime time;

  Quote({
    required this.author,
    required this.quotes,
    required this.time,
  });
}
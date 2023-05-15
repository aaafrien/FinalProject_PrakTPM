import 'package:hive/hive.dart';

part 'quotes_lib.g.dart'; // generate file using build_runner

@HiveType(typeId: 0)
class Quote extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String body;

  Quote({
    required this.author,
    required this.body,
  });
}

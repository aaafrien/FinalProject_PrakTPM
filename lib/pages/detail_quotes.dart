import 'package:flutter/material.dart';

class DetailQuotes extends StatelessWidget {
  final String? body;
  final String? author;

  const DetailQuotes({Key? key, required this.body, required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes by ${author}"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("${body}"),
            SizedBox(height: 20),
            Text("by ${author}"),
          ],
        ),
      ),
    );
  }
}

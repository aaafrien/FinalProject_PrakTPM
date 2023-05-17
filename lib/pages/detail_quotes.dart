import 'package:finalproject/components/navbar.dart';
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
        actions: [
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBar(),
                    ),
                  ),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
              ],
            ),
          )
        ],
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

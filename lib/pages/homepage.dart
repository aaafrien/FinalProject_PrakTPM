import 'package:finalproject/model/quotes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.format_quote_rounded),
                  Text(
                    "Quotable",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Random Quotes",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Quotes of The Day",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuotesSection(
      final double width, final double height, final List<Quotes> quotes) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              right: width / 20,
              left: width / 20,
            ),
            padding: EdgeInsets.all(16.0),
            width: width / 1.1,
            height: height / 5,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Text(
                    quotes[index].quote.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    quotes[index].author.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

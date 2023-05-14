import 'package:finalproject/controller/quotes_data_source.dart';
import 'package:finalproject/model/quotes.dart';
import 'package:finalproject/model/quotes_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:finalproject/boxes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  // final String text;

  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late SharedPreferences prefs;
  late int totalQuote;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    prefs = await SharedPreferences.getInstance();
  }

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
              SizedBox(height: 20),
              Container(
                child: FutureBuilder(
                  // future: QuotesDataSource.instance.loadQuotes(widget.text),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasError) {
                      // return _buildErrorSection();
                    }
                    if (snapshot.hasData) {
                      Quotes quote = Quotes.fromJson(snapshot.data);
                      // return _buildSuccessSection(quote);
                    }
                    return _buildLoadingSection();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // Widget _buildErrorSection() {
  //   if (widget.text.isEmpty) {
  //     return const Text("Search bar cannot be Empty");
  //   } else {
  //     return const Text("Error acquired");
  //   }
  // }
}

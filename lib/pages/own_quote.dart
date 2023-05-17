import 'dart:developer';
import 'package:finalproject/model/quotes_lib.dart';
import 'package:finalproject/pages/add_quotes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../boxes.dart';

class OwnQuotePage extends StatefulWidget {
  const OwnQuotePage({Key? key}) : super(key: key);

  @override
  State<OwnQuotePage> createState() => _OwnQuotePageState();
}

class _OwnQuotePageState extends State<OwnQuotePage> {
  late Box<Quote> _quoteLib;

  @override
  void initState() {
    super.initState();
    _quoteLib = Hive.box<Quote>(HiveBoxes.quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Own Quote"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddQuote(),
                ),
              );
            },
          )
        ],
      ),
      body: ValueListenableBuilder<Box>(
        valueListenable: _quoteLib.listenable(),
        builder: (context, value, child) {
          if (value.isEmpty) {
            return Center(
              child: Text('Quote tidak tersedia'),
            );
          }
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              log(value.length.toString());
              Quote quotes = value.getAt(index);
              return Dismissible(
                key: UniqueKey(),
                child: ListTile(
                  title: Text(quotes.quotes),
                  subtitle: Text(quotes.author + quotes.time.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

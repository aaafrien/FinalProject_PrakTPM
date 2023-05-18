import 'dart:developer';
import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/model/quotes_lib.dart';
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
        title: Text("Own Quotes"),
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
                  child: Card(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                quotes.quotes,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.justify,
                              ),
                              Text(quotes.author),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    quotes.time.toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Palette.mainColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}

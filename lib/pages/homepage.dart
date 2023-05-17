import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/pages/detail_quotes.dart';
import 'package:finalproject/service/base_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late SharedPreferences prefs;
  late int totalQuote;
  String search = "";

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
    final BaseNetwork baseNetwork = BaseNetwork();
    return Scaffold(
      appBar: appBarHomepage(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchContainer(),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Add Quote",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Quotes of The Day",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                initialData: [],
                future: search != ""
                    ? baseNetwork.fetchQuotesTag(search)
                    : baseNetwork.fetchQuotes(),
                builder: (context, AsyncSnapshot snapshot) {
                  // print(snapshot.data.length == 0);
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (!snapshot.hasData) {
                    return Center(
                      child: Text('No Quotes'),
                    );
                  } else if (snapshot.data.length == 0) {
                    return Center(
                      child: Text('No Quotes'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailQuotes(
                                  body: snapshot.data![index].body,
                                  author: snapshot.data![index].author),
                            ),
                          ),
                          child: Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data![index].body),
                                        Text(
                                          snapshot.data![index].author,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Palette.mainColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBarHomepage() {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.format_quote_rounded),
          Text(
            "Quotable",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Container searchContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: TextFormField(
        onFieldSubmitted: (value) => {
          setState(() {
            search = value;
          })
        },
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_outlined),
            hintText: 'search quotes',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(10),
            ))),
      ),
    );
  }
}

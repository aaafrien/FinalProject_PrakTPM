import 'package:finalproject/pages/detail_quotes.dart';
import 'package:finalproject/service/base_network.dart';
import 'package:flutter/material.dart';

class ListQuotes extends StatefulWidget {
  const ListQuotes({Key? key}) : super(key: key);

  @override
  State<ListQuotes> createState() => _ListQuotesState();
}

class _ListQuotesState extends State<ListQuotes> {
  @override
  Widget build(BuildContext context) {
    final BaseNetwork baseNetwork = BaseNetwork();

    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes of The Day"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: baseNetwork.fetchQuotes(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No data'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].body),
                    subtitle: Text(snapshot.data[index].author),
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailQuotes(
                            body: snapshot.data![index].body,
                            author: snapshot.data![index].author),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/login.dart';
import 'package:finalproject/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.mainColor,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Homepage(),
    );
  }
}

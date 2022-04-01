import 'package:dental_app/pages/detail_page.dart';
import 'package:dental_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DentalApp());
}

class DentalApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


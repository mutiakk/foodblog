import 'package:flutter/material.dart';
import 'package:foodblog/cartCalculate/calculate_price.dart';
import 'package:foodblog/ui/list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return Price();
    },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mantap',
          home: ListFood()),
    );
  }
}
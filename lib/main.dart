import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/homepage.dart';

void main() async {

  //hive init
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
    );
  }
}

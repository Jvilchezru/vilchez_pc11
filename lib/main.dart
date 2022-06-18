import 'package:flutter/material.dart';
import 'package:vilchez_pc11/pages/list/list_page.dart';
import 'package:vilchez_pc11/pages/register/register_page.dart';
import 'package:vilchez_pc11/utils/my_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: MyColors.primaryColor,
      ),
      routes: {
        '/list': (context) => ListPage(),
        '/register':(context) => RegisterPage()
      },
      initialRoute: '/list',
      debugShowCheckedModeBanner: false,
    );
  }
}

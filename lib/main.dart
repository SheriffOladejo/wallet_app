import 'package:flutter/material.dart';
import 'package:wallet_app/views/get_started_screen.dart';
import 'package:wallet_app/views/home_screen.dart';
import 'package:wallet_app/views/secret_phrase.dart';
import 'package:wallet_app/views/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SecretPhrase(),
    );
  }
}

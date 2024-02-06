import 'package:flutter/material.dart';
import 'package:primus_suites/features/Home%20Scree/views/dashboard.dart';
import 'package:primus_suites/features/Home%20Scree/views/receivemoney.dart';
import 'package:primus_suites/features/Home%20Scree/views/sendmoney.dart';
import 'package:primus_suites/features/Onoarding/welcome.dart';
import 'package:primus_suites/features/authentication/views/signin.dart';
import 'package:primus_suites/features/authentication/views/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SendMoney(),

    );
  }
}


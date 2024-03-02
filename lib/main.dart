import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/colors.dart';
import 'package:primus_suites/features/Home%20Scree/views/dashboard.dart';
import 'package:primus_suites/features/authentication/views/otp_page.dart';
import 'package:primus_suites/features/authentication/views/signin.dart';
// import 'package:primus_suites/features/Home%20Scree/views/buyairtime.dart';
// import 'package:primus_suites/features/Home%20Scree/views/receivemoney.dart';
// import 'package:primus_suites/features/Home%20Scree/views/sendmoney.dart';
// import 'package:primus_suites/features/Home%20Scree/views/transfer_success.dart';
// import 'package:primus_suites/features/Onoarding/welcome.dart';
import 'package:primus_suites/features/authentication/views/signup.dart';
// import 'package:primus_suites/features/Onoarding/welcome.dart';
//import 'package:primus_suites/features/Home%20Scree/views/dashboard.dart';
//import 'package:primus_suites/features/Home%20Scree/views/receivemoney.dart';
//import 'package:primus_suites/features/Home%20Scree/views/sendmoney.dart';
//import 'package:primus_suites/features/Onoarding/welcome.dart';
//import 'package:primus_suites/features/authentication/views/signin.dart';
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        ),
        home: const OTPpage());
  }
}

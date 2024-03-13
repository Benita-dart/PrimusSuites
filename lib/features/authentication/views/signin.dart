import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:primus_suites/API/api_sigin_in.dart';
import 'package:primus_suites/common/widgets/colors.dart';
import 'package:primus_suites/features/Home%20Scree/views/dashboard.dart';
import 'package:primus_suites/features/authentication/views/signup.dart';

import '../models/user_data.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final API api = API();

  final loginIdController = TextEditingController();
  final passwordController = TextEditingController();

  void _signin() async {
    final String loginId = loginIdController.text;
    final String password = passwordController.text;

    try {
      bool success = await api.signin(loginId, password);
      if (success) {
        String firstName = api.loginData.data.user.firstName;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(firstName: firstName),
          ),
        );
      } else {
        print('Login failed');
        if (api.loginData.message != null && api.loginData.message.isNotEmpty) {
          print('Server error: ${api.loginData.message}');
        }
      }
    } catch (e) {
      print('Error: $e');
      print('Login error: ${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomLabeledInput(
                  controller: loginIdController,
                  label: 'loginId',
                  title: 'Username',
                  prefixIcon: Icons.person_rounded,
                ),
                CustomLabeledInput(
                  controller: passwordController,
                  label: 'Password',
                  title: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(
                  width: size.width * 0.9,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: ()  {
                      _signin();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
                    ),
                    child: const Text('Sign In'),
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: size.width * 0.9,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountScreen(
                            username: '',
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                      side: MaterialStateProperty.all(const BorderSide(
                        color: AppColors.signInButtonBorderColor,
                      )),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: AppColors.buttonColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLabeledInput extends StatelessWidget {
  final String label;
  final String title;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomLabeledInput({
    Key? key,
    required this.label,
    required this.title,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: Icon(prefixIcon, color: Colors.black),
              border: InputBorder.none,
            ),
            obscureText: obscureText,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

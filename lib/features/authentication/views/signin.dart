import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:primus_suites/API/api_sigin_in.dart';
import 'package:primus_suites/common/widgets/colors.dart';
import 'package:primus_suites/features/Home%20Scree/views/dashboard.dart';
import 'package:primus_suites/features/authentication/views/signup.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final loginIdController = TextEditingController();
  final passwordController = TextEditingController();

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
                    onPressed: () async {
                      // Get the values of username and password from the TextFormField
                      String loginId = loginIdController.text;
                      String password = passwordController.text;

                      // Make sure username and password are not empty
                      if (loginId.isEmpty || password.isEmpty) {
                        // Show an error message or toast
                        debugPrint('Input password or username');
                        return;
                      }

                      // Call the API to sign in
                      String? token = await API.signin(loginId, password);
                      if (token == null) {
                        // Handle sign-in failure, show error message
                        print('Sign-in failed');
                      } else {

                        Map<String, dynamic> responseData = json.decode(token);
                        String firstName = responseData['data']['user']['first_name'];

                        if (firstName != null) {
                          // Sign-in successful, navigate to the home page passing token and firstName

                          print('Sign-in successful. Token: $token');
                          print(firstName);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(
                                token: token,
                                firstName: firstName,
                              ),
                            ),
                          );
                        }
                      }
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

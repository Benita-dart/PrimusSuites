import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:primus_suites/common/widgets/colors.dart';
import 'package:primus_suites/features/Home%20Scree/views/dashboard.dart';
import 'package:primus_suites/features/authentication/views/signup.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController loginIdController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                  label: 'Login ID',
                  title: 'Login ID',
                  prefixIcon: Icons.person_rounded,
                  controller: loginIdController,
                ),
                CustomLabeledInput(
                  label: 'Password',
                  title: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(
                  width: size.width * 0.9,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      String loginId = loginIdController.text.trim();
                      String password = passwordController.text.trim();

                      // Validate input
                      if (loginId.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter login ID and password')),
                        );
                        return;
                      }

                      // API endpoint
                      String apiUrl = 'https://dev-api-gateway.primussuite.com/api/v1/users/pre-login';

                      try {
                        var response = await http.post(
                          Uri.parse(apiUrl),
                          body: {
                            'loginId': loginId,
                            'password': password,
                          },
                        );

                        // Check status code
                        if (response.statusCode == 200) {

                          var data = json.decode(response.body);
                          String token = data['token'];
                          print('Token: $token');

                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => MyHomePage(token: token))
                          );
                        } else {
                          String errorMessage = 'Failed to sign in. Please try again.';
                          if (response.statusCode == 401) {
                            errorMessage = 'Invalid login ID or password.';
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorMessage)),
                          );
                          // Debug error
                          print('Signin Error: ${response.reasonPhrase}');
                          print('Response body: ${response.body}');
                        }
                      } catch (e) {
                        // Handle exceptions
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $e')),
                        );
                        // Debug error
                        print('Signin Exception: $e');
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
                          builder: (context) => CreateAccountScreen(username: ''),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                      side: MaterialStateProperty.all(
                        const BorderSide(color: AppColors.signInButtonBorderColor),
                      ),
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
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomLabeledInput({
    required this.label,
    required this.title,
    required this.prefixIcon,
    this.obscureText = false,
    this.controller,
  });

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

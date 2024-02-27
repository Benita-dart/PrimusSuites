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
                  label: 'Username',
                  title: 'Username',
                  prefixIcon: Icons.person_rounded,
                ),
                CustomLabeledInput(
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
                      final usernameController = TextEditingController();
                      final passwordController = TextEditingController();

                      String username = usernameController.text;
                      String password = passwordController.text;

                      // Make sure username and password are not empty
                      if (username.isEmpty || password.isEmpty) {
                        // Show an error message or toast
                        return;
                      }

                      // API endpoint
                      String apiUrl = 'https://44.215.210.13:3007/api/v1/users/login';

                      try {
                        // Make POST request
                        var response = await http.post(
                          Uri.parse(apiUrl),
                          body: {
                            'username': username,
                            'password': password,
                          },
                        );

                        // Check status code
                        if (response.statusCode == 200) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage(username: '',)),
                          );
                        } else {
                          // Handle other status codes (e.g., show error message)
                          // You might want to decode the response body for more specific error handling
                          print('Error: ${response.reasonPhrase}');
                        }
                      } catch (e) {
                        // Handle exceptions
                        print('Error: $e');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.buttonColor),
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
                          builder: (context) => CreateAccountScreen(username: '',),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.signInButtonColor),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: AppColors.signInButtonBorderColor)),
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

  const CustomLabeledInput({
    required this.label,
    required this.title,
    required this.prefixIcon,
    this.obscureText = false,
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

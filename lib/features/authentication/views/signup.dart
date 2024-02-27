import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:primus_suites/common/widgets/colors.dart';
import 'package:primus_suites/features/Home%20Scree/views/dashboard.dart';
import 'package:primus_suites/features/authentication/views/signin.dart';

class CreateAccountScreen extends StatelessWidget {
  final TextEditingController bvnController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String username;

  CreateAccountScreen({required this.username});

  Future<void> createUser(BuildContext context) async {
    final url = Uri.parse('http://44.215.210.13:3007/api/v1/users/create');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'bvn': bvnController.text,
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'username': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // User created successfully, you can navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(username: '',)),
      );
    } else {
      // If the server returns an error
      throw Exception('Failed to create user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0), // Add spacing at the top
              const Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomLabeledInput(
                label: 'Bank Verification Number',
                title: 'BVN',
                prefixIcon: Icons.numbers,
                controller: bvnController,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomLabeledInput(
                      label: 'First Name',
                      title: 'First Name',
                      prefixIcon: Icons.person,
                      controller: firstNameController,
                    ),
                  ),
                  Expanded(
                    child: CustomLabeledInput(
                      label: 'Last Name',
                      title: 'Last Name',
                      prefixIcon: Icons.person,
                      controller: lastNameController,
                    ),
                  ),
                ],
              ),
              CustomLabeledInput(
                label: 'Username',
                title: 'Username',
                prefixIcon: Icons.person_rounded,
                controller: usernameController,
              ),
              CustomLabeledInput(
                label: 'Email Address',
                title: 'Email',
                prefixIcon: Icons.email,
                controller: emailController,
              ),
              CustomLabeledInput(
                label: 'Password',
                title: 'Password',
                prefixIcon: Icons.lock,
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    createUser(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
                  ),
                  child: const Text('Register'),
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signin(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                    side: MaterialStateProperty.all(const BorderSide(color: AppColors.signInButtonBorderColor)),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: AppColors.buttonColor),
                  ),
                ),
              ),
            ],
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
  final TextEditingController controller;

  CustomLabeledInput({
    required this.label,
    required this.title,
    required this.prefixIcon,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
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

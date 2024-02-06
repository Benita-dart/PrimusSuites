import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/colors.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const CustomLabeledInput(
              label: 'Username',
              title: 'Username',
              prefixIcon: Icons.person_rounded,
            ),
            const CustomLabeledInput(
              label: 'Password',
              title: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 200.0),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Handle registration button press
                  print('Register button pressed');
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
              width: double.infinity,
              height: 45,
              child: OutlinedButton(
                onPressed: () {
                  // Handle sign-in button press
                  print('Sign In button pressed');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.signInButtonColor),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: AppColors.signInButtonBorderColor)),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(color: AppColors.buttonColor),
                ),
              ),
            ),
          ],
        ),
      )),
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

import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/colors.dart';




class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0), // Add spacing at the top
              const Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              CustomLabeledInput(
                label: 'Bank Verification Number',
                title: 'BVN',
                prefixIcon: Icons.numbers,
              ),
              Row(
                children: [
                  Expanded(
                  child: CustomLabeledInput(
                      label: 'First Name',
                      title: 'First Name',
                      prefixIcon: Icons.person,
                    ),
                  ),
                  Expanded(
                    child: CustomLabeledInput(
                      label: 'Last Name',
                      title: 'Last Name',
                      prefixIcon: Icons.person,
                    ),
                  ),
                ],
              ),
              CustomLabeledInput(
                label: 'Username',
                title: 'Username',
                prefixIcon: Icons.person_rounded,
              ),
              CustomLabeledInput(
                label: 'Email Address',
                title: 'Email',
                prefixIcon: Icons.email,
              ),
              CustomLabeledInput(
                label: 'Password',
                title: 'Password',
                prefixIcon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle registration button press
                    print('Register button pressed');
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
                    // Handle sign-in button press
                    print('Sign In button pressed');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                    side: MaterialStateProperty.all(BorderSide(color: AppColors.signInButtonBorderColor)),
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

  CustomLabeledInput({
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
        SizedBox(height: 8.0),
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
        SizedBox(height: 16.0),
      ],
    );
  }
}

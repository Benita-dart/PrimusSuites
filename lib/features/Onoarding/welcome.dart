import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60.0,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Lorem ipsum dolor sit amet consectetur, Amet nibh ',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
                  fontSize: 36,
              fontFamily: 'Inter'
            ),
            ),
          ),
          const SizedBox(height: 50,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Lorem ipsum dolor sit amet consectetur. Diam vivamus mattis pulvin',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),),
          ),
          const SizedBox(height: 250.0),
          SizedBox(
            width: 500,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {
                  // Handle sign-in button press
                  print('Sign In button pressed');
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
          ),
        ],
      ),
    );
  }
}

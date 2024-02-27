import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/colors.dart';
import 'package:primus_suites/features/authentication/views/signin.dart';
import 'package:primus_suites/features/authentication/views/signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80.0,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Join millions of people like you on the better side of Banking ',
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
              child: Text('Experience modern day financial technology services like never before',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccountScreen(username: '',),
                      ),
                    );
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
            ),
          ],
        ),
      ),
    );
  }
}

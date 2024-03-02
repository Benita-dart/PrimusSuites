import 'package:flutter/material.dart';
import 'package:primus_suites/features/authentication/views/signin.dart';

import '../../../common/widgets/colors.dart';

class OTPpage extends StatefulWidget {
  const OTPpage({super.key});

  @override
  State<OTPpage> createState() => _OTPpageState();
}

class _OTPpageState extends State<OTPpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signin(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  'OTP',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            CustomLabeledInput(
              label: 'Enter OTP',
              title: 'One-time Password',
            ),
            const SizedBox(height: 420),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.buttonColor),
                ),
                child: const Text('Verify OTP'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

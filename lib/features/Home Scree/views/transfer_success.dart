import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/colors.dart';

import 'dashboard.dart';

class TransferSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Transfer.png', // Replace this with your image path
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Transfer Successful',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Add logic to download receipt
                    },
                    child: const Text('Download Receipt', style: TextStyle(
                      color: AppColors.primaryColor,
                    ),),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      // Add logic to share receipt
                    },
                    child: const Text('Share Receipt', style: TextStyle(
                      color: AppColors.primaryColor,
                    ),),
                  ),
                ],
              ),
              const SizedBox(height: 180),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                  Navigator.push(context,
                       MaterialPageRoute(
                           builder: (context) => MyHomePage(username: '',)
                       ));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
                  ),
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
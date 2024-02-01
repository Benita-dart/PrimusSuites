import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/colors.dart';

class ReceiveMoney extends StatelessWidget {
  const ReceiveMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.back),
                  Text('Receive Money', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    fontFamily: 'Inter',
                  ),),
                ],
              ),
              SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for Savings Account button
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
                    ),
                    child: Text('Savings Account'),
                  ),
                   SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for Current Account button
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                      side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                    ),
                    child: const Text('Current Account', style: TextStyle(
                      color: Colors.black,
                    ),),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Current Balance', ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('₦346,000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

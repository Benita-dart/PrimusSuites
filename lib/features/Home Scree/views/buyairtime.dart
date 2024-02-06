import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/textstyles.dart';

import '../../../common/widgets/colors.dart';

class BuyAirtime extends StatelessWidget {
  const BuyAirtime({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0,),
              Row(
                children: [
                  Icon(CupertinoIcons.back),
                  Text('Buy Airtime',
                      style: AppText.bigText
                  ),
                ],
              ),

              const SizedBox(height: 16.0,),
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
                    child: const Text('Savings Account', style: AppText.smallBoldText,),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for Current Account button
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                      side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                    ),
                    child: const Text('Current Account', style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',

                    ),),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Current Balance', style: AppText.smallBoldText,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('₦346,000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0,),
              const Text('Enter Amount', style: AppText.mainText,),
              const CustomLabeledInput(label: 'Enter Amount', prefixIcon: Icons.house),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(onPressed: () {},

                        child: const Text(
                          '₦200', style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      ),
                      OutlinedButton(onPressed: () {},

                        child: const Text(
                          '₦500', style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      ),
                      OutlinedButton(onPressed: () {},

                        child: const Text(
                          '₦1,000', style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(onPressed: () {},

                        child: const Text(
                          '₦2,000',style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      ),
                      OutlinedButton(onPressed: () {},

                        child: const Text(
                          '₦5,000', style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      ),
                      OutlinedButton(onPressed: () {},

                        child: const Text(
                          '₦10,000', style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0,),
              const Text('Enter Phone Number', style: AppText.mainText,),
              const CustomLabeledInput(label: 'Enter Amount', prefixIcon: Icons.numbers),

              const SizedBox(height: 10.0,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
                  ),
                  child: const Text(
                      'Buy Airtime'
                  ),),
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
  final IconData prefixIcon;
  final bool obscureText;

  const CustomLabeledInput({
    required this.label,
    required this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
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

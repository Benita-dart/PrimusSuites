import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/textstyles.dart';
import 'package:primus_suites/features/Home%20Scree/views/transfer_success.dart';

import '../../../common/widgets/colors.dart';
import 'dashboard.dart';

class BuyAirtime extends StatelessWidget {
  const BuyAirtime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0,),
               Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(username: '',)
                        ));
                  }, icon: const Icon(CupertinoIcons.back)),
                  const Text('Buy Airtime',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                    ),
                  )
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
                    child: const Text('Savings Account'),
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
                    child:  const Text('Current Account', style: TextStyle(
                      color: Colors.black,
                    ),),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Available Balance', ),
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
              const SizedBox(height: 15.0,),
              const Text('Enter Amount', style: AppText.mainText,),
              const SizedBox(height: 10,),
              const CustomLabeledInput(label: 'Enter Amount', prefixIcon: Icons.numbers,),
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
                  )
                ],
              ),
              const SizedBox(height: 15.0,),
              const Text('Enter phone number', style: AppText.mainText,),
              const SizedBox(height: 5.0,),
              const CustomLabeledInput(label: 'Enter Phone Number', prefixIcon: Icons.numbers,),
              const SizedBox(height: 80,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Purchase"),
                        content: const Text("Are you sure you want to make this purchase?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => TransferSuccessScreen()
                                  ));
                            },
                            child: const Text("Yes", style: TextStyle(
                              color: Colors.black,
                            ),),
                          ),
                          TextButton(
                            onPressed: () {
                              // Close the dialog
                              Navigator.of(context).pop();
                            },
                            child: const Text("No", style: TextStyle(
                              color: AppColors.primaryColor,
                            ),),
                          ),
                        ],
                      );
                    },
                  );
                },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
                  ),
                  child: const Text(
                      ' Buy airtime'
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

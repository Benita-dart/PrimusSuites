import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primus_suites/features/authentication/views/signin.dart';

import '../../../common/widgets/colors.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.0,),
              const Row(
                children: [
                  Icon(CupertinoIcons.back),
                  Text('Send Money', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    fontFamily: 'Inter',
                  ),),
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
                    child: Text('Savings Account'),
                  ),
                  const SizedBox(width: 10),
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
                  Text('Available balance', ),
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
              SizedBox(height: 16.0,),
              Text('Enter Amount',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              ),
              CustomLabeledInput(label: 'Enter the amount to send', prefixIcon: Icons.numbers,),
             Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     OutlinedButton(onPressed: () {},

                         child: Text(
                           '₦10,000', style: TextStyle(
                           color: Colors.black,
                         ),
                     ),
                      ),
                     OutlinedButton(onPressed: () {},

                       child: Text(
                         '₦20,000', style: TextStyle(
                         color: Colors.black,
                       ),
                       ),
                     ),
                     OutlinedButton(onPressed: () {},

                       child: Text(
                         '₦50,000', style: TextStyle(
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

                       child: Text(
                         '₦100,000',style: TextStyle(
                         color: Colors.black,
                       ),
                       ),
                     ),
                     OutlinedButton(onPressed: () {},

                       child: Text(
                         '₦200,000', style: TextStyle(
                         color: Colors.black,
                       ),
                       ),
                     ),
                     OutlinedButton(onPressed: () {},

                       child: Text(
                         '₦500,000', style: TextStyle(
                         color: Colors.black,
                       ),
                       ),
                     ),
                   ],
                 )
               ],
             ),
              SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Destination Bank',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  Row(
                    children: [
                      Text('Select Beneficiary',),
                      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                    ],
                  )
                ],
              ),
              CustomLabeledInput(label: 'Enter the amount to send', prefixIcon: Icons.house,),
              SizedBox(height: 80.0,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
                    ),
                    child: Text(
                      'Send Money'
                    ),),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class CustomLabeledInput extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final bool obscureText;

  CustomLabeledInput({
    required this.label,
    required this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0),
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
        SizedBox(height: 16.0),
      ],
    );
  }
}

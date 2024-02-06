import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:primus_suites/features/authentication/views/signin.dart';

import '../../../common/widgets/colors.dart';
import '../../../common/widgets/textstyles.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0,),
              const Row(
                children: [
                  Icon(CupertinoIcons.back),
                  Text('Send Money', style: AppText.bigText),
                ],
              ),
              const SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for Savings Account button
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
                      ),
                      child: const Text('Savings Account', style: AppText.smallBoldText ,),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality for Current Account button
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                        side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                      ),
                      child: const Text('Current Account', style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        fontFamily: 'Inter',
                      ),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Available balance:', style: AppText.smallBoldText,),
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
              const SizedBox(height: 16.0,),
              const Text('Enter Amount',
              style: AppText.mainText,
              ),
              const CustomLabeledInput(label: 'Enter the amount to send', prefixIcon: Icons.numbers,),
             Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     OutlinedButton(onPressed: () {},

                         child: const Text(
                           '₦10,000', style: TextStyle(
                           color: Colors.black,
                         ),
                     ),
                      ),
                     OutlinedButton(onPressed: () {},

                       child: const Text(
                         '₦20,000', style: TextStyle(
                         color: Colors.black,
                       ),
                       ),
                     ),
                     OutlinedButton(onPressed: () {},

                       child: const Text(
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

                       child: const Text(
                         '₦100,000',style: TextStyle(
                         color: Colors.black,
                       ),
                       ),
                     ),
                     OutlinedButton(onPressed: () {},

                       child: const Text(
                         '₦200,000', style: TextStyle(
                         color: Colors.black,
                       ),
                       ),
                     ),
                     OutlinedButton(onPressed: () {},

                       child: const Text(
                         '₦500,000', style: TextStyle(
                         color: Colors.black,
                       ),
                       ),
                     ),
                   ],
                 )
               ],
             ),
              const SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Destination Bank',
                  style: AppText.mainText
                  ),
                  Row(
                    children: [
                      const Text('Choose a Beneficiary', style: AppText.smallBoldText,),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_drop_down))
                    ],
                  )
                ],
              ),
              const CustomLabeledInput(label: 'Enter the amount to send', prefixIcon: Icons.house,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 _circleButton(Colors.grey, 'assets/images/gtbank-logo.png'),
                 _circleButton(Colors.grey, 'assets/images/gtbank-logo.png'),
                 _circleButton(Colors.grey, 'assets/images/gtbank-logo.png'),
                 _circleButton(Colors.grey, 'assets/images/gtbank-logo.png'),
                 _circleButton(Colors.grey, 'assets/images/gtbank-logo.png'),
               ],
             ),
              const SizedBox(height: 10.0),
              const Text('Destination Account',),
              const CustomLabeledInput(label: 'Enter account number', prefixIcon: Icons.house,),
              const SizedBox(height: 10.0,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
                    ),
                    child: const Text(
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

Widget _circleButton(Color outerColor, String imagePath){
  return  Center(
    child: CircleAvatar(
      radius: 20,
     backgroundColor: outerColor,
       child: Center(
         child: CircleAvatar(
         radius: 10,
         backgroundImage: AssetImage(imagePath),
     ),
       ),
    ),
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/colors.dart';
import 'package:primus_suites/common/widgets/textstyles.dart';
import 'package:primus_suites/features/Home%20Scree/views/buyairtime.dart';
import 'package:primus_suites/features/Home%20Scree/views/receivemoney.dart';
import 'package:primus_suites/features/Home%20Scree/views/sendmoney.dart';

class MyHomePage extends StatelessWidget {
  final String username;

  MyHomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0,),
              Text(
                'Hello, $username', // Replace "Username" with the actual username
                style: AppText.mainText,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.add_circle, size: 28, color: AppColors.primaryColor),
                  SizedBox(width: 10),
                  Text(
                    'Add New Account',
                    style: AppText.smallBoldText,
                  ),
                ],
              ),
              const SizedBox(height: 5),
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
                    child: const Text('Current Account', style: TextStyle(
                      color: Colors.black,
                    ),),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                height: size.height * 0.2, // 20% of screen height
                width: size.width * 0.9, // 90% of screen width
                decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Available Balance',
                        style: TextStyle(fontSize: 10
                            , fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '₦346,000',
                            style: TextStyle(fontSize: 32,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => const SendMoney()
                                ));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                            side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                          ),
                          child: const Text('Send Money', style: TextStyle(
                            color: Colors.black,
                          ),),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => const ReceiveMoney()
                                ));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                            side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                          ),
                          child: const Text('Receive Money', style: TextStyle(
                              color: Colors.black
                          ),),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => const BuyAirtime()
                                ));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                            side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                          ),
                          child: const Text('Bill Payment', style: TextStyle(
                            color: Colors.black,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0,),
              const Text('Quick links', style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )
              ),
              const SizedBox(height:10.0,),
              Container(
                height: size.height * 0.1, // 10% of screen height
                width: size.width * 0.9, // 90% of screen width
                decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCircleButton(Colors.black, AppColors.quickLinksButtonColor, 'Bills'),
                    _buildCircleButton(Colors.black, AppColors.quickLinksButtonColor, 'Airtime'),
                    _buildCircleButton(Colors.black, AppColors.quickLinksButtonColor, 'Data'),
                    _buildCircleButton(Colors.black, AppColors.quickLinksButtonColor, 'Gift Cards'),
                    _buildCircleButton(Colors.black, AppColors.quickLinksButtonColor, 'Cable TV'),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Transactions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text('see more',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0,),
              Container(
                height: size.height * 0.3, // 30% of screen height
                width: size.width * 0.9, // 90% of screen width
                decoration: const BoxDecoration(
                  color: CupertinoColors.systemGrey5,
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    _buildTransactionItem(Icons.arrow_downward, 'Account Deposit', '2024-02-01 10:30 AM', 'View Receipt','\₦500.00', Colors.green, ),
                    _buildTransactionItem(Icons.arrow_upward, 'Payment', '2024-02-02 03:45 PM', 'View Receipt','\₦200.00', Colors.red ,),
                    _buildTransactionItem(Icons.arrow_upward, 'Payment', '2024-02-02 03:45 PM', 'View Receipt','\₦10,000.00', Colors.red ,),
                    // Add more transactions as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCircleButton(Color outerColor, Color innerColor, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: outerColor,
        ),
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: innerColor,
            ),
          ),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        label,
        style: const TextStyle(fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w400),
      ),
    ],
  );
}

Widget _buildTransactionItem(IconData icon, String title, String timestamp, String type, String amount, Color iconColor) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5.0),
              Text(
                timestamp,
                style: AppText.smallItalicText,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 4.0),
            Text(
              amount,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              type,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.red),
            ),
          ],
        ),

      ],
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primus_suites/features/Home%20Scree/views/transfer_success.dart';
import 'dart:convert';

import '../../../common/widgets/colors.dart';
import '../../../common/widgets/textstyles.dart';
import 'dashboard.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  String? _selectedValue;
  TextEditingController _amountController = TextEditingController();
  List<Map<String, dynamic>> _banksList = [];

  @override
  void initState() {
    super.initState();
    _loadBanks();
  }

  Future<void> _loadBanks() async {
    // Load banks JSON file
    String banksJson = await rootBundle.loadString('assets/banks/banks.json');
    List<dynamic> banks = json.decode(banksJson);
    _banksList = banks.cast<Map<String, dynamic>>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          double screenWidth = MediaQuery.of(context).size.width;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40.0,),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(username: ''),
                            ),
                          );
                        },
                        icon: const Icon(CupertinoIcons.back),
                      ),
                      const Text('Send Money', style: AppText.bigText),
                    ],
                  ),
                  const SizedBox(height: 16.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                          ),
                          child: const Text('Savings Account', style: AppText.smallBoldText),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.signInButtonColor),
                            side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                          ),
                          child: const Text(
                            'Current Account',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Available balance:', style: AppText.smallBoldText),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '₦346,000',
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
                  const Text('Enter Amount', style: AppText.mainText),
                  CustomLabeledInput(label: 'Enter the amount to send', prefixIcon: Icons.attach_money, controller: _amountController,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setAmount('₦10,000');
                            },
                            child: const Text(
                              '₦10,000',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setAmount('₦20,000');
                            },
                            child: const Text(
                              '₦20,000',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setAmount('₦50,000');
                            },
                            child: const Text(
                              '₦50,000',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setAmount('₦100,000');
                            },
                            child: const Text(
                              '₦100,000',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setAmount('₦200,000');
                            },
                            child: const Text(
                              '₦200,000',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setAmount('₦500,000');
                            },
                            child: const Text(
                              '₦500,000',
                              style: TextStyle(
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
                      const Text(
                        'Destination Bank',
                        style: AppText.mainText,
                      ),
                      Row(
                        children: [
                          const Text('Choose a Beneficiary', style: AppText.smallBoldText),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
                        ],
                      )
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      return DropdownButtonFormField(
                        value: _selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue as String?;
                          });
                        },
                        items: _banksList.map((bank) {
                          return DropdownMenuItem(
                            value: bank['code'].toString(),
                            child: Text(bank['name'].toString()),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          prefixIcon: const Icon(Icons.house, color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Destination Account'),
                  const CustomLabeledInput(label: 'Enter account number', prefixIcon: Icons.account_circle),
                  const SizedBox(height: 20.0,),
                  SizedBox(
                    width: screenWidth, // Adjusting width based on screen size
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm Transfer"),
                              content: const Text("Are you sure you want to make this transfer?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TransferSuccessScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text("Yes", style: TextStyle(color: Colors.black)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("No", style: TextStyle(color: AppColors.primaryColor)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                      ),
                      child: const Text('Send Money'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void setAmount(String amount) {
    setState(() {
      _amountController.text = amount;
    });
  }
}

class CustomLabeledInput extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomLabeledInput({
    required this.label,
    required this.prefixIcon,
    this.obscureText = false,
    this.controller,
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
            controller: controller,
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

Widget _circleButton(Color outerColor, String imagePath) {
  return Center(
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

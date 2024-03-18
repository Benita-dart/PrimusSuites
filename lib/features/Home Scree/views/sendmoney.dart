import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primus_suites/features/Home%20Scree/models/balance.dart';
import 'package:primus_suites/features/Home%20Scree/views/transfer_success.dart';
import 'dart:convert';

import '../../../API/api_sigin_in.dart';
import '../../../common/widgets/colors.dart';
import '../../../common/widgets/textstyles.dart';
import 'dashboard.dart';
import 'package:http/http.dart' as http;

class SendMoney extends StatefulWidget {
  const SendMoney({
    Key? key,
  }) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final API api = API();
  late String accountId;
  String? _selectedBankCode;
  final TextEditingController _amountController = TextEditingController();
  // TextEditingController _destinationAccountController = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  List<Map<String, dynamic>> _banksList = [];
  BalanceData? balance = BalanceData(availableBalance: "");

  Future<void> fetchBalanceInUI() async {
    balance = await api.fetchBalance();
    print('Balance = ${balance?.availableBalance}');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadBanks();
    _loadAccountData();
    fetchBalanceInUI();

    _accountNumberController.addListener(() {
      if (_accountNumberController.text.length == 10 &&
          _selectedBankCode != null) {
        _loadAccountData();
      }
    });
  }

  Future<void> _loadAccountData() async {
    final accountNumber = _accountNumberController.text;
    final bankCode = _selectedBankCode;

    try {
      final accountLookupResult =
          await api.accountLookup(accountNumber, bankCode);
      print('Account Lookup Successful!');
      print('Account Name: ${accountLookupResult.data.name}');

      // You can set the state with the retrieved data and update the UI
      setState(() {
        _accountNameController.text = accountLookupResult.data.name ?? '';
      });
    } catch (e) {
      print('Error during account lookup: $e');
      // Handle errors or display an error message to the user
    }
  }

  @override
  void dispose() {
    _accountNumberController.dispose();
    super.dispose();
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

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Dashboard(firstName: ''),
                            ),
                          );
                        },
                        icon: const Icon(CupertinoIcons.back),
                      ),
                      const Text('Send Money', style: AppText.bigText),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor),
                          ),
                          child: const Text('Savings Account',
                              style: AppText.smallBoldText),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.signInButtonColor),
                            side: MaterialStateProperty.all(
                                const BorderSide(color: Colors.black)),
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Available balance:',
                          style: AppText.smallBoldText),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '₦${balance?.availableBalance}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text('Enter Amount', style: AppText.mainText),
                  CustomLabeledInput(
                    label: 'Enter the amount to send',
                    prefixIcon: Icons.attach_money,
                    controller: _amountController,
                  ),
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
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Destination Bank',
                        style: AppText.mainText,
                      ),
                      Row(
                        children: [
                          const Text('Choose a Beneficiary',
                              style: AppText.smallBoldText),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_drop_down)),
                        ],
                      )
                    ],
                  ),
                  Builder(builder: (context) {
                    return DropdownButtonFormField(
                      value: _selectedBankCode,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedBankCode = newValue;
                        });
                      },
                      items: _banksList.map((bank) {
                        return DropdownMenuItem(
                          value: bank['code'].toString(),
                          child: Text(bank['name'].toString()),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.house, color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 10.0),
                  const Text('Destination Account'),
                  CustomLabeledInput(
                    label: 'Enter account_lookup.dart number',
                    prefixIcon: Icons.account_circle,
                    controller: _accountNumberController,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    _accountNameController.text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
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
                              content: const Text(
                                  "Are you sure you want to make this transfer?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    initiateTransfer(context);
                                  },
                                  child: const Text("Yes",
                                      style: TextStyle(color: Colors.black)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("No",
                                      style: TextStyle(
                                          color: AppColors.primaryColor)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor),
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

  // void lookupAccount(BuildContext context) async {
  //   final accountNumber = _accountNumberController.text;
  //   final bankCode = _selectedBankCode;
  //
  //   if (accountNumber.isEmpty || bankCode == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please enter account_lookup.dart number and select a bank')),
  //     );
  //     return;
  //   }
  //
  //   final url = Uri.parse('https://staging-api-gateway.primussuite.com/api/v1/transaction/account_lookup?account_number=$accountNumber&bank_code=$bankCode');
  //
  //   final payload = {
  //     "account_number": accountNumber,
  //     "bank_code": bankCode,
  //   };
  //
  //   try {
  //     final response = await http.get(url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer ', // Add the token to the headers
  //       },
  //
  //
  //     );
  //
  //     // Log the payload
  //     debugPrint('Payload: $payload');
  //
  //     if (response.statusCode == 200) {
  //       final jsonData = jsonDecode(response.body);
  //       final status = jsonData['status'];
  //       final reason = jsonData['reason'];
  //       final accountName = jsonData['account_name'];
  //
  //       setState(() {
  //         _accountNameController.text = accountName ?? '';
  //       });
  //
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Status: $status, Reason: $reason')),
  //       );
  //     } else {
  //       final error = jsonDecode(response.body)['error'];
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Failed to lookup account_lookup.dart: $error')),
  //       );
  //
  //
  //       debugPrint('Full Response: ${response.body}');
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error: $e')),
  //     );
  //
  //     debugPrint('Error: $e');
  //   }
  // }

  void initiateTransfer(BuildContext context) async {
    final accountNumber = _accountNumberController.text;
    final bankCode = _selectedBankCode;

    if (accountNumber.isEmpty || bankCode == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Please enter account_lookup.dart number and select a bank')),
      );
      return;
    }
    final url = Uri.parse(
        'https://staging-api-gateway.primussuite.com/api/v1/transaction/initiate_transfer_request');

    final payload = {
      "account_number": accountNumber,
      "bank_code": bankCode,
    };

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(payload),
      );

      // Log the payload
      debugPrint('Payload: $payload');

      if (response.statusCode == 200) {
        // Transaction initiated successfully
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransferSuccessScreen(),
          ),
        );
      } else {
        // If the server returns an error
        final error = jsonDecode(response.body)['error'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to initiate transfer: $error')),
        );

        // Log the error
        debugPrint('Error: $error');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      // Log the error
      debugPrint('Error: $e');
    }
  }
}

class CustomLabeledInput extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomLabeledInput({
    super.key,
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

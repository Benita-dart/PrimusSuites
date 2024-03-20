import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/textstyles.dart';
import 'package:primus_suites/features/Home%20Scree/models/balance.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../common/widgets/colors.dart';
import 'dashboard.dart';

class ReceiveMoney extends StatelessWidget {
  const ReceiveMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard(
                                      firstName: '',
                                    )));
                      },
                      icon: const Icon(CupertinoIcons.back)),
                  const Text(
                    'Receive Money',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for Savings Account button
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor)),
                    child: const Text('Savings Account'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for Current Account button
                    },
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
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Current Balance',
                  ),
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
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Scan QR code',
                style: AppText.mainText,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: QrImageView(
                  data: 'Account Number',
                  version: QrVersions.auto,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 80.0),
                    child: Text(
                      'Account Number:',
                      style: TextStyle(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 80.0),
                    child: Text(
                      '1234567890',
                      style: AppText.smallBoldText,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 80.0),
                    child: Text(
                      'Tag',
                      style: TextStyle(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 80.0),
                    child: Text(
                      '@JohnDoe',
                      style: AppText.smallBoldText,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 80.0),
                    child: Text(
                      'Link:',
                      style: TextStyle(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 80.0),
                    child: Text(
                      'Zenith Bank',
                      style: AppText.smallBoldText,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor)),
                  child: const Text('Share Link'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

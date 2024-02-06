import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primus_suites/common/widgets/textstyles.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../common/widgets/colors.dart';

class ReceiveMoney extends StatelessWidget {
  const ReceiveMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              const Row(
                children: [
                  Icon(CupertinoIcons.back),
                  Text('Receive Money', style: TextStyle(
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
              const SizedBox(height: 20,),
              const Text('Scan QR code', style: AppText.mainText,),
              const SizedBox(height: 10.0,),
              QrImageView(
                data: 'account details',
                version: QrVersions.auto,
                size: 200.0,
              ),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Text('Account Number:', style: AppText.mainText,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 60.0),
                    child: Text('123456780', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ), ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Text('Tag', style: AppText.mainText,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 60.0),
                    child: Text('@JohnDoe', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ), ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Text('Link', style: AppText.mainText,),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 60.0),
                    child: Text('Zenith Bank', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ), ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(onPressed: () {},
                    // handle button function here
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.primaryColor)
                  ),
                    child: const Text('Share Details', style: AppText.mainText,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

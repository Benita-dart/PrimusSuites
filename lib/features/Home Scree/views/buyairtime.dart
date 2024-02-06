import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyAirtime extends StatelessWidget {
  const BuyAirtime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.0,),
              Icon(CupertinoIcons.back),
              Text('Buy Airtime',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight:
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

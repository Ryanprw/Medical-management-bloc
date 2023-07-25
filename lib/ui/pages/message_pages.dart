import 'package:flutter/material.dart';
import 'package:login/shared/theme.dart';
import 'package:lottie/lottie.dart';

class MessagePages extends StatelessWidget {
  const MessagePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: LottieBuilder.asset(
                  "assets/Comp.json",
                ),
              ),
              Text(
                "Coming Soon!",
                style: blackTextStyle.copyWith(
                  fontSize: 35,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

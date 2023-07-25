import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obsucreText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.obsucreText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: obsucreText,
            cursorColor: blackColor,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(
                  color: greenColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

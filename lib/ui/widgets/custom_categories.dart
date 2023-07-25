import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomCategories extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CustomCategories(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(2, 2),
                color: purpelColor,
              )
            ],
          ),
          child: Image.asset(
            imageUrl,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: greyTexte.copyWith(
            fontSize: 12,
            fontWeight: medium,
          ),
        )
      ],
    );
  }
}

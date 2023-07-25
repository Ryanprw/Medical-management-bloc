import 'package:flutter/material.dart';
import 'package:login/shared/theme.dart';

class CusttomProfile extends StatelessWidget {
  final String title;
  final String text;
  final String imageUrl;

  const CusttomProfile({
    super.key,
    required this.title,
    required this.text,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 32,
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            margin: EdgeInsets.only(right: 22),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                text,
                style: greyTexte.copyWith(
                  fontSize: 12,
                  fontWeight: reguler,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

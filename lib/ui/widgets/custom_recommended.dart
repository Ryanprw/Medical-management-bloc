import 'package:flutter/material.dart';
import 'package:login/shared/theme.dart';

class RecommendedTitle extends StatelessWidget {
  final String name;
  final String title;
  final String imageUrl;
  final double rating;

  const RecommendedTitle(
      {super.key,
      required this.name,
      required this.title,
      required this.imageUrl,
      this.rating = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 112,
            height: 112,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: purpelColor,
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: blackTexte.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                title,
                style: greyTexte.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    margin: EdgeInsets.only(
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 218, 179),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/Vector5.png"),
                      ),
                    ),
                  ),
                  Text(
                    rating.toString(),
                    style: blackTexte.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        margin: EdgeInsets.only(
                          right: 8,
                          left: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 175, 250, 177),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/Vector6.png"),
                          ),
                        ),
                      ),
                      Text(
                        "01:00 - 08:00 PM",
                        style: blackTexte.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

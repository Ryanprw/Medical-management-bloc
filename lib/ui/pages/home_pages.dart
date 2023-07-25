import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cubit/auth_cubit.dart';
import 'package:login/shared/theme.dart';
import 'package:login/ui/widgets/custom_categories.dart';
import 'package:login/ui/widgets/custom_recommended.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.only(right: 19),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/image_profile7.png",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: redColor,
                              size: 15,
                            ),
                            Text(
                              "${state.user.city}",
                              style: greyTexte.copyWith(
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Hello, ",
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                            children: [
                              TextSpan(
                                text: "${state.user.name}",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon_notification.png"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget bannerBar() {
      return Container(
        margin: EdgeInsets.only(
          top: 32,
        ),
        child: Container(
          width: double.infinity,
          height: 170,
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: purpelColor,
            boxShadow: [
              BoxShadow(
                color: purpelColor,
                blurRadius: 10,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                width: 119,
                height: 180,
                margin: EdgeInsets.only(left: 210),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/image_doctor3.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Simple Ways\nfor Healthy Life",
                      style: whiteText.copyWith(
                        fontSize: 22,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "How to find a healthy lifestyle\nin the middle of a tough job.",
                      style: whiteText.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: 45,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCategories(
              imageUrl: "assets/Vector.png",
              title: "Find Doctor",
            ),
            CustomCategories(
              imageUrl: "assets/Vector2.png",
              title: "Hospital",
            ),
            CustomCategories(
              imageUrl: "assets/Vector3.png",
              title: "Covid-19",
            ),
            CustomCategories(
              imageUrl: "assets/Vector4.png",
              title: "Ambulance",
            ),
          ],
        ),
      );
    }

    Widget recommendedDoctor() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 115,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recommended Doctor",
              style: blackTextStyle.copyWith(
                fontSize: 17,
                fontWeight: bold,
              ),
            ),
            RecommendedTitle(
              name: "Dr. Wilson",
              title: "General Pulmonologist",
              imageUrl: "assets/image_doctor4.png",
              rating: 4.8,
            ),
            RecommendedTitle(
              name: "Dr. Christoper",
              title: "General Pulmonologist",
              imageUrl: "assets/image_doctor5.png",
              rating: 4.8,
            ),
            RecommendedTitle(
              name: "Dr. Anna",
              title: "General Pulmonologist",
              imageUrl: "assets/image_doctor6.png",
              rating: 4.5,
            ),
            RecommendedTitle(
              name: "Dr. Hendra",
              title: "General Pulmonologist",
              imageUrl: "assets/image_doctor7.png",
              rating: 4.5,
            ),
            RecommendedTitle(
              name: "Dr. Christy",
              title: "General Pulmonologist",
              imageUrl: "assets/image_doctor8.png",
              rating: 4.5,
            ),
          ],
        ),
      );
    }

    return Scaffold(
        body: ListView(
      children: [
        header(),
        bannerBar(),
        categories(),
        recommendedDoctor(),
      ],
    ));
  }
}

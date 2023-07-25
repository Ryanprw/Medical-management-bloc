import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cubit/page_cubit.dart';
import 'package:login/shared/theme.dart';
import 'package:login/ui/pages/clock_pages.dart';
import 'package:login/ui/pages/home_pages.dart';
import 'package:login/ui/pages/message_pages.dart';
import 'package:login/ui/pages/profile_pages.dart';

import '../widgets/custom_buttom_nav.dart';

class MainPages extends StatelessWidget {
  const MainPages({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currendIndex) {
      //NOTE: Membuat pengkodisian
      switch (currendIndex) {
        case 0:
          return HomePages();
        case 1:
          return ClockPages();
        case 2:
          return MessagePages();
        case 3:
          return ProfilePages();
        default:
          return HomePages();
      }
    }

    Widget customBottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavigatorCusttom(
                index: 0,
                imageUrl: "assets/icon_home1.png",
              ),
              BottomNavigatorCusttom(
                index: 1,
                imageUrl: "assets/icon_clock.png",
              ),
              BottomNavigatorCusttom(
                index: 2,
                imageUrl: "assets/icon_message.png",
              ),
              BottomNavigatorCusttom(
                index: 3,
                imageUrl: "assets/icon_profile.png",
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNav(),
            ],
          ),
        );
      },
    );
  }
}

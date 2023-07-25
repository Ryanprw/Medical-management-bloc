import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cubit/auth_cubit.dart';
import 'package:login/cubit/page_cubit.dart';
import 'package:login/shared/theme.dart';

import '../widgets/custom_profile.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({super.key});

  @override
  Widget build(BuildContext context) {
    Widget contentProfile() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    width: 74,
                    height: 74,
                    margin: EdgeInsets.only(
                      right: 24,
                    ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${state.user.name}",
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget LogoutButton() {
      return Container(
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: purpelColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),
          onPressed: () {
            context.read<AuthCubit>().signOut();
          },
          child: Text(
            "Logout",
            style: whiteTextStyle.copyWith(fontSize: 22, fontWeight: bold),
          ),
        ),
      );
    }

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context)
              ..showSnackBar(
                SnackBar(
                  backgroundColor: redColor,
                  content: Text(state.error),
                ),
              );
          } else if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              children: [
                contentProfile(),
                CusttomProfile(
                  title: "Account",
                  text: "Privacy, secutrity, change email or number",
                  imageUrl: "assets/icon_user1.png",
                ),
                CusttomProfile(
                  title: "Chats",
                  text: "Theme, wallpapers, chat history",
                  imageUrl: "assets/icon_chat.png",
                ),
                CusttomProfile(
                  title: "Help",
                  text: "Help cenre, contact us, privacy policy",
                  imageUrl: "assets/icon_help.png",
                ),
                SizedBox(
                  height: 20,
                ),
                LogoutButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}

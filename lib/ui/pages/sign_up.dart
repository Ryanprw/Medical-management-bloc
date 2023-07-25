import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cubit/auth_cubit.dart';
import 'package:login/shared/theme.dart';
import 'package:login/ui/widgets/custom_textfield.dart';

class SignUpPages extends StatelessWidget {
  SignUpPages({super.key});

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController cityController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Center(
        child: Container(
          child: Text(
            "Register Your Account",
            style: purpelTextStyle.copyWith(
              fontSize: 26,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextField(
          title: "Full Name",
          hintText: "Enter Your Full Name",
          controller: nameController,
        );
      }

      Widget passwordInput() {
        return CustomTextField(
          title: "Password",
          hintText: "Enter Your Password",
          obsucreText: true,
          controller: passwordController,
        );
      }

      Widget emailInput() {
        return CustomTextField(
          title: "Email",
          hintText: "Enter Your Email",
          controller: emailController,
        );
      }

      Widget cityInput() {
        return CustomTextField(
          title: "City",
          hintText: "Enter Your City",
          controller: cityController,
        );
      }

      //Note: Buttom SignUp
      Widget submitButton() {
        return Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(top: 30),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSucces) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(context)
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: redColor,
                      content: Text(state.error),
                    ),
                  );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: purpelColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
                onPressed: () {
                  context.read<AuthCubit>().signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        city: cityController.text,
                      );
                },
                child: Text(
                  "Register",
                  style:
                      whiteTextStyle.copyWith(fontSize: 22, fontWeight: bold),
                ),
              );
            },
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Column(
          children: [
            nameInput(),
            passwordInput(),
            emailInput(),
            cityInput(),
            submitButton(),
          ],
        ),
      );
    }

    //Note: untuk pindah ke halaman SignIn
    Widget signIn() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 29,
            bottom: 73,
          ),
          child: RichText(
            text: TextSpan(
              text: "Don’t have an account? ",
              style: blueTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              children: [
                TextSpan(
                  text: "Sign In",
                  style: blueTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            signIn(),
          ],
        ),
      ),
    );
  }
}

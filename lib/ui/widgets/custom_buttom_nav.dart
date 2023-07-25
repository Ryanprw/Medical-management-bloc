import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cubit/page_cubit.dart';

import '../../shared/theme.dart';

class BottomNavigatorCusttom extends StatelessWidget {
  final int index;
  final String imageUrl;

  const BottomNavigatorCusttom({
    super.key,
    required this.imageUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? purpelColor
                  : transparantColor,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
            ),
          ),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? whiteColor
                : blackColor,
          )
        ],
      ),
    );
  }
}

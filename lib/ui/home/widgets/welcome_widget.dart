import 'package:flutter/material.dart';
import 'package:tasks/core/resources/colors.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height - 10,
          color: AppColors.welcomeBackground,
        ),
        Positioned(bottom: 15, child: Image.asset("assets/welcome-image.png")),
        Positioned(
            right: 16,
            top: size.height / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "أهلا بيك فى مهارة..ابدأ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "بتعليم طفلك",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        Positioned(
          bottom: 0,
          right: 1,
          left: 1,
          child: Container(
            width: size.width,
            height: size.width * 0.04,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.width * 0.2),
                topRight: Radius.circular(size.width * 0.2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

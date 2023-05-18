import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/welcome-backgound.png"),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 24,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            // do action here
                          },
                          child: Image.asset("assets/dots.png")),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            // do action here
                          },
                          child: Image.asset("assets/child.png")),
                    ],
                  ),
                  Image.asset("assets/logo.png"),
                ],
              ),
            ),
          ),
          Positioned(
              right: 24,
              top: size.height / 2.3,
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
            bottom: 1,
            right: 1,
            left: 1,
            child: Container(
              width: size.width,
              height: 16,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
            ),
          ),
        ],
      ),
    );
  }
}

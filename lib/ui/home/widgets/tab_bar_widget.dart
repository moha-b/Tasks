import 'package:flutter/material.dart';
import 'package:tasks/core/resources/colors.dart';

class TabBarSection extends StatelessWidget {
  TabBarSection({Key? key}) : super(key: key);
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      height: size.height * 0.3,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) => _buildTab(index))),
    );
  }

  Widget _buildTab(index) {
    List<String> categories = [
      "",
      "مهارات و ذاكرة",
      "مهارات القرائة",
      "المجموعات",
    ];
    return SizedBox(
      width: size.width * 0.19,
      child: Stack(
        children: [
          Image.asset(
            "assets/blue-circ.png",
          ),
          Positioned(
              right: 1,
              child: Image.asset(
                "assets/boy.png",
                height: size.height * 0.21,
              )),
          index == 0
              ? const Positioned(
                  bottom: 1,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "اختيار التحصيل",
                      ),
                      Text("اللغوى")
                    ],
                  ),
                )
              : Positioned(
                  bottom: 20,
                  left: 30,
                  child: Text(
                    categories[index],
                  ),
                ),
        ],
      ),
    );
  }
}

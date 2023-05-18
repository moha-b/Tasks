import 'package:flutter/material.dart';

class TabBarSection extends StatefulWidget {
  final Function(int) onItemSelected;
  final int initialSelectedIndex;

  TabBarSection(
      {Key? key, required this.onItemSelected, this.initialSelectedIndex = 3})
      : super(key: key);

  @override
  _TabBarSectionState createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.initialSelectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> categories = [
      "",
      "مهارات و ذاكرة",
      "مهارات القرائة",
      "المجموعات",
    ];
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      height: size.height * 0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          categories.length,
          (index) {
            return _TabBarItem(
              title: categories[index],
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
                widget.onItemSelected(value);
              },
              index: index,
              isSelected: index == selectedIndex,
            );
          },
        ),
      ),
    );
  }
}

class _TabBarItem extends StatelessWidget {
  final String title;
  final int index;
  final bool isSelected;
  final Function(int) onTap;

  const _TabBarItem({
    Key? key,
    required this.title,
    required this.onTap,
    required this.index,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: size.width * 0.2,
        child: Stack(
          children: [
            isSelected
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/selected.png",
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        "assets/indicator.png",
                        fit: BoxFit.fill,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Image.asset(
                        "assets/not-selected.png",
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
            index == 0
                ? const Positioned(
                    top: 50,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("اختيار التحصيل"),
                        Text("اللغوى"),
                      ],
                    ),
                  )
                : Positioned(
                    top: 60,
                    left: 25,
                    child: Text(
                      title,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

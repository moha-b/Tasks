import 'package:flutter/material.dart';

class MyAvatarRow extends StatefulWidget {
  final List<String> items = [
    'التميز العام',
    'التطابق',
    'التعميم',
    'الاختيار',
    'التعريف',
  ];

  @override
  _MyAvatarRowState createState() => _MyAvatarRowState();
}

class _MyAvatarRowState extends State<MyAvatarRow> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAvatar(0, widget.items[0], Color(0xfffef5f6)),
        _buildAvatar(1, widget.items[1], Color(0xfffef5f6)),
        _buildAvatar(2, widget.items[2], Color(0xfffef5f6)),
        _buildAvatar(3, widget.items[3], Color(0xfffef5f6)),
        _buildAvatar(4, widget.items[4], Color(0xfffef5f6)),
      ],
    );
  }

  Widget _buildAvatar(int index, String name, Color color) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: isSelected ? Color(0xfffaa29d) : color,
              child: Text(
                name,
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xfffaa29d),
                  fontSize: 17,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

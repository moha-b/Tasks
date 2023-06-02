import 'package:flutter/material.dart';
import 'package:tasks/core/resources/colors.dart';
import 'package:tasks/ui/verbdetails/verbs_detail_screen.dart';

import '../../../data/models/verbs_list.dart';

class MyHorizontalList extends StatefulWidget {
  final List<VerbsList> list;

  const MyHorizontalList({super.key, required this.list});

  @override
  _MyHorizontalListState createState() => _MyHorizontalListState();
}

class _MyHorizontalListState extends State<MyHorizontalList> {
  late int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.list.length,
          itemBuilder: (BuildContext context, int index) {
            _selectedIndex = widget.list[index].verbId;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Material(
                color: _selectedIndex == index
                    ? AppColors.categoriesBlueCard
                    : Color(0xffF6FAFC),
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VerbsDetailScreen(id: widget.list[index].verbId),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: Text(
                        widget.list[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _selectedIndex == index
                              ? Colors.black
                              : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

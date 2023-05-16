import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasks/ui/home/widgets/section_screen.dart';
import 'package:tasks/ui/home/widgets/tab_bar_widget.dart';
import 'package:tasks/ui/home/widgets/welcome_widget.dart';

import '../../core/resources/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            WelcomeSection(),
            TabBarSection(),
            Container(
                margin: EdgeInsets.only(right: 16, top: 24),
                alignment: Alignment.centerRight,
                child: Text(
                  "اكتشف جميع أقسامنا",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sections(),
                      ));
                },
                child: Text("Show Section")),
          ]),
        ),
      ),
    );
  }
}

/*
*
*/

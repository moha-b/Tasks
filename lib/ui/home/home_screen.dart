import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/ui/home/bloc/categories_bloc.dart';
import 'package:tasks/ui/home/widgets/categories_grid_view_widget.dart';
import 'package:tasks/ui/home/widgets/tab_bar_widget.dart';
import 'package:tasks/ui/home/widgets/welcome_widget.dart';

class HomeScreen extends StatelessWidget {
  int selectedTabIndex = 0;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return BlocProvider(
      create: (context) => CategoriesBloc()..add(CategoriesEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            const WelcomeSection(),
            TabBarSection(
              onItemSelected: (index) {},
            ),
            Container(
                margin: EdgeInsets.only(right: 16, top: 24, bottom: 10),
                alignment: Alignment.centerRight,
                child: Text(
                  "اكتشف جميع أقسامنا",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            CategoriesGridView(),
          ]),
        ),
      ),
    );
  }
}

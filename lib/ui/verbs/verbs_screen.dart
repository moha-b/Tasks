import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/ui/verbdetails/verbs_detail_screen.dart';

import 'bloc/verb_bloc.dart';

class VerbsScreen extends StatelessWidget {
  const VerbsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: Stack(
                children: [
                  Container(
                    color: const Color(0xffEDF4F8),
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Container(),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "الافعال",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset("assets/back.svg"),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 100,
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xffFAA29D),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child:
                                  SvgPicture.asset("assets/white-arrow.svg")),
                          const Expanded(
                            child: Text(
                              "التالى",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 25,
                    child: Text(
                      "اختر قسمك المفضل",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            BlocProvider(
              create: (context) => VerbBloc()..add(const VerbEvent()),
              child: BlocBuilder<VerbBloc, VerbState>(
                builder: (context, state) {
                  if (state is VerbLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is VerbLoaded) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemCount: state.verb.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VerbsDetailScreen(
                                        id: state.verb[index].verbId),
                                  ));
                            },
                            child: buildCat(index, state.verb[index].name)),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("Api Error"),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildCat(int index, String text) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xffF6FAFC),
    ),
    child: Stack(
      children: [
        SvgPicture.asset(
            index % 2 != 0 ? "assets/do-girl.svg" : "assets/do-boy.svg"),
        Positioned(top: 55, left: 35, child: Text(text)),
      ],
    ),
  );
}

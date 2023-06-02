import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/ui/verbdetails/widgets/avatar_row.dart';
import 'package:tasks/ui/verbdetails/widgets/horizontal_list.dart';
import 'package:tasks/ui/verbs/bloc/verb_bloc.dart';

import 'bloc/verbsdetail_bloc.dart';

class VerbsDetailScreen extends StatelessWidget {
  final int id;

  const VerbsDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => VerbsDetailBloc()..add(VerbDetailEvent(id)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      Container(
                        color: const Color(0xffEDF4F8),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 10,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 2,
                              child:
                                  BlocBuilder<VerbsDetailBloc, VerbDetailState>(
                                builder: (context, state) {
                                  if (state is VerbStateLoaded) {
                                    return Text(
                                      state.result.name,
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                      child: Text("Api Error"),
                                    );
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset("assets/back.svg")),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 70,
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
                                  child: SvgPicture.asset(
                                      "assets/white-arrow.svg")),
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
                    ],
                  ),
                ),
                BlocBuilder<VerbsDetailBloc, VerbDetailState>(
                  builder: (context, state) {
                    if (state is VerbStateLoaded) {
                      return Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 16),
                              child: Text(state.result.name)),
                          const SizedBox(
                            height: 200,
                            width: double.infinity,
                            // child: VideoWidget(
                            //   id: state.result.videos['video2']!,
                            // ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: Text("Api Error"),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    right: 25,
                    left: 25,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        BlocProvider(
                          create: (context) => VerbBloc()..add(VerbEvent()),
                          child: BlocBuilder<VerbBloc, VerbState>(
                            builder: (context, state) {
                              if (state is VerbLoaded) {
                                return MyHorizontalList(
                                  list: state.verb,
                                );
                              } else {
                                return Center(
                                  child: Text("Api Error"),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        MyAvatarRow(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

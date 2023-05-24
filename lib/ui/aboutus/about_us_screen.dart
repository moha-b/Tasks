import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/core/resources/strings.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDialog(
                              content: Column(
                                children: [
                                  SvgPicture.asset("assets/two-kids.svg"),
                                  Text("هل أنت متأكد من حذف الحساب؟")
                                ],
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.more_vert_outlined),
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                          onTap: () {
                            /// TODO [
                            /// 1 - Implement action here
                            /// 2 - Add some Padding with the extension function
                            /// ]
                          },
                          child: SvgPicture.asset("assets/child-icon.svg")),
                    ),
                    Expanded(
                      flex: 10,
                      child: Image.asset("assets/logo.png"),
                    ),
                    Expanded(
                      flex: 1,
                      child: SvgPicture.asset("assets/back.svg"),
                    ),
                  ],
                ),
              ),
              Text("عن مهارات طفل"),
              Text(AppString.aboutUsText),
            ],
          ),
        ),
      ),
    );
  }
}

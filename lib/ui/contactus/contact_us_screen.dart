import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
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
                      Expanded(flex: 11, child: SizedBox.shrink()),
                      Expanded(child: Text("التواصل")),
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset("assets/back.svg"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width / 2,
                  margin: EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("البريد الالكترونى"),
                            Row(
                              children: [
                                Expanded(child: Text("info@mahara.com")),
                                Expanded(
                                    child: SvgPicture.asset("assets/file.svg")),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 5,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("رقم الجوال"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(child: Text("123456789")),
                                Expanded(
                                  child: SvgPicture.asset(
                                    "assets/call.svg",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 32,
              top: 70,
              child: SvgPicture.asset(
                "assets/sign.svg",
              ),
            ),
            Positioned(
              bottom: 1,
              left: 32,
              child: SvgPicture.asset(
                "assets/flower.svg",
              ),
            ),
            Positioned(
              bottom: 32,
              right: 32,
              child: SvgPicture.asset(
                "assets/list-of-icons.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

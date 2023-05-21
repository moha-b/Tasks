import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
      body: Column(
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
                      /// logEvent("TAP");
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
                  child: Container(),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "الاعدادات",
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
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("الصوت"),
                      GestureDetector(
                        onTap: () {
                          /// TODO [
                          /// 1 - Implement action here
                          /// 2 - Add some Padding with the extension function
                          /// ]
                        },
                        child: SvgPicture.asset("assets/sound.svg"),
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
                      Text("استقبال الاشعارات"),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

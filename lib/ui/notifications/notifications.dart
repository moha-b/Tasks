import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return Scaffold(
      body: Column(
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
                const Expanded(
                  flex: 10,
                  child: SizedBox.shrink(),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "الاشعارات",
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 32),
              itemBuilder: (context, index) => const NotificationItem(),
            ),
          )
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("! درس جديد"),
              Text("هناك درس جديد لك تم اضافته على قائمة المجموعات"),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Image.asset("assets/logo.png"),
        ],
      ),
    );
  }
}

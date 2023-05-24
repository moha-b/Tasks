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
                      const Expanded(
                        child: Text(
                          "التواصل",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: SvgPicture.asset("assets/back.svg")),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2,
                  margin: const EdgeInsets.all(32),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ContactUsData(
                          dataType: "البريد الالكترونى",
                          data: "info@mahara.com",
                          svgImagePath: "assets/file.svg",
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        width: 5,
                      ),
                      ContactUsData(
                        dataType: "رقم الجوال",
                        data: "123456789",
                        svgImagePath: "assets/call.svg",
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
              bottom: 32,
              right: 32,
              child: SocialMedialLinks(),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMedialLinks extends StatelessWidget {
  SocialMedialLinks({
    super.key,
  });

  List social = [
    "assets/facebook-f.svg",
    "assets/instagram.svg",
    "assets/whatsapp.svg",
    "assets/twitter.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => InkWell(
            onTap: () {
              if (social[index].toString().contains("twitter")) {
                print("Twitter");
              } else if (social[index].toString().contains("whatsapp")) {
                print("whatsapp");
              } else if (social[index].toString().contains("instagram")) {
                print("instagram");
              } else {
                print(social[index]);
              }
            },
            child: SvgPicture.asset(
              social[index],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactUsData extends StatelessWidget {
  final String dataType;
  final String data;
  final String svgImagePath;
  const ContactUsData(
      {Key? key,
      required this.dataType,
      required this.data,
      required this.svgImagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(right: 0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(dataType),
                  Text(data),
                ],
              ),
              SvgPicture.asset(
                svgImagePath,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

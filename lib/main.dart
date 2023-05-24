import 'package:flutter/material.dart';
import 'package:tasks/ui/notifications/notifications.dart';

void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
/*
* Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 250,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent[100],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              Positioned(
                top: 1,
                left: 1,
                right: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.close),
                ),
              ),
              Positioned(
                left: 1,
                right: 1,
                top: 40,
                child: Column(
                  children: [
                    SvgPicture.asset("assets/two-kids.svg"),
                    Text("هل أنت متأكد من حذف الحساب؟"),
                    Row(
                      children: [
                        Container(),
                        Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
* */

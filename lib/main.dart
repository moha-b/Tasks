import 'package:flaticon/flaticon.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: City(),
    debugShowCheckedModeBanner: false,
  ));
}

class City extends StatelessWidget {
  const City({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FlatIcons.star_solid,
              size: 50,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

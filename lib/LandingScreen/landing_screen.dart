import 'package:flutter/material.dart';
import 'package:mqtt_app/constants.dart';
import 'package:mqtt_app/LandingScreen/components/body.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: LandingScreenBody(),
    );
  }
}

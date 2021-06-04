import 'package:flutter/material.dart';
import 'package:mqtt_app/constants.dart';
import 'package:mqtt_app/SensorScreen/components/body.dart';
import 'package:mqtt_app/posgres_database.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({Key key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgColor,
        body: SensorScreenBody(),
    );
  }
}

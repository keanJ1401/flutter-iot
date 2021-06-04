import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_app/LandingScreen/landing_screen.dart';
import 'package:mqtt_app/SensorScreen/sensor_screen.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:postgres/postgres.dart';
import 'MqttClient/components/connection.dart';
import 'package:mqtt_app/posgres_database.dart';




main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart Home",
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      // home: LandingScreen(),
      home: SensorScreen()
    );
  }
}



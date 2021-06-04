import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_app/constants.dart';
import 'package:mqtt_app/LandingScreen/components/control_button.dart';
import 'package:mqtt_app/LandingScreen/components/default_button.dart';
import 'package:mqtt_app/SensorScreen/sensor_screen.dart';

class LandingScreenBody extends StatefulWidget {
  const LandingScreenBody({Key key}) : super(key: key);

  @override
  _LandingScreenBodyState createState() => _LandingScreenBodyState();
}

class _LandingScreenBodyState extends State<LandingScreenBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: size.height * 0.1),
            Center(
              child: Text("Where do you think you\'ll\n mostly use",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05,),
            Center(
              child: Text ("Tap on all that apply. This will help us\ncustomize your home pages.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kDarkGreyColor,
                fontSize: 18,
              ),
              ),
            ),
            SizedBox(height: size.height * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControlButton(
                  size: size,
                  title: "Maintenance\nrequests",
                  icon: Icons.settings_outlined,
                ),
                ControlButton(
                    size: size,
                    title: "Integration\n",
                    icon: Icons.grain,
                ),
                ControlButton(
                    size: size,
                    title: "Light\nControl",
                    icon: Icons.highlight,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControlButton(
                  size: size,
                  title: "Leak\nDetector",
                  icon: Icons.opacity,
                ),
                ControlButton(
                  size: size,
                  title: "Temperature\nControl",
                  icon: Icons.ac_unit,
                ),
                ControlButton(
                  size: size,
                  title: "Guest\nAccess",
                  icon: Icons.vpn_key,
                ),
                ]
            ),
            SizedBox(height: size.height * 0.05,),
            DefaultButton(size: size, title: "Next", press: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context) => SensorScreen()));
            },),
            SizedBox(height: size.height * 0.05,),
          ],
        ),
      );
    }
  }


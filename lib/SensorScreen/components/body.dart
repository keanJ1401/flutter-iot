import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_app/MqttClient/components/connection.dart';
import 'package:mqtt_app/constants.dart';
import 'package:mqtt_app/SensorScreen/components/custom_card.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../../posgres_database.dart';

class SensorScreenBody extends StatefulWidget {
  const SensorScreenBody({Key key}) : super(key: key);

  @override
  _SensorScreenBody createState() => _SensorScreenBody();
}

class _SensorScreenBody extends State<SensorScreenBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: kDarkGreyColor,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: size.height * 0.045,
                  width: size.width * 0.095,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications_none,
                    color: kDarkGreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/cat_profile.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "May 16, 2021",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Good Night, \nKeanJ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        '50',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'TEMPERATURE',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '59%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "HUMIDITY",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCard(
                  size: size,
                  icon: Icon(
                    Icons.home_outlined,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "ENTRY",
                  statusOn: "OPEN",
                  statusOff: "LOCKED",
                ),
                CustomCard(
                  size: size,
                  icon: Icon(
                    Icons.lightbulb_outline,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "LIGHT",
                  statusOn: "ON",
                  statusOff: "OFF",
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCard(
                  size: size,
                  icon: Icon(
                    Icons.opacity,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "LEAKS",
                  statusOn: "DETECTED",
                  statusOff: "NOT DETECTED",
                ),
                CustomCard(
                  size: size,
                  icon: Icon(
                    Icons.thermostat_outlined,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "THERMOSTAT",
                  statusOn: "ON",
                  statusOff: "OFF",
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: 75,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kBgColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(3, 3),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0,
                    offset: Offset(-3, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ADD",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "NEW CONTROL",
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

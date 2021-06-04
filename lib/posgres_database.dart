import 'package:postgres/postgres.dart';


Future<List<Sensors>> initDB() async {
  var conn = PostgreSQLConnection(
      "35.229.136.180", 5432, "smarthome",
      username: "postgres",
      password: "user"
      );
  try {
    await conn.open();
    print("Connect to PostgreSQL");
  } catch (e) {
    print('Error: $e');
  }

  List<Map<String, Map<String, dynamic>>> resultSensors = await conn.mappedResultsQuery('''
  SELECT sensors.sensor_id, value, time FROM sensors JOIN (
  SELECT sensors.sensor_id, max(time) AS last_order_date FROM sensors GROUP BY sensor_id) AS last_values
  ON sensors.time = last_values.last_order_date
  ORDER BY sensors.sensor_id''');

  List<Sensors> sensors =[];
  for (var row in resultSensors){
    Map<String, dynamic> each = {};
    row['sensors'].forEach((key, value) {
      each[key.toString()] = value;
    });
    Sensors sensor = Sensors(each['id'], each['sensors_id'], each['value'], each['time']);
    sensors.add(sensor);
  }
  await conn.close();
}

class Sensors {
  final int id;
  final int sensor_id;
  final Map<String, dynamic> value;
  final DateTime time;
  Sensors(this.id, this.sensor_id, this.value, this.time);
}




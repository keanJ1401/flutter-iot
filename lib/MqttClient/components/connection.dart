import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


Future<MqttServerClient> connect() async {
  MqttServerClient client =
  MqttServerClient.withPort(
      'x10eb792.us-east-1.emqx.cloud', 'flutter_client', 15923);
  // client.logging(on: true);
  client.onConnected = onConnected;
  client.onDisconnected = onDisconnected;
  client.onUnsubscribed = onUnsubscribed;
  client.onSubscribed = onSubscribed;
  client.onSubscribeFail = onSubscribeFail;
  client.pongCallback = pong;
  client.keepAlivePeriod = 60;

  final connMessage = MqttConnectMessage()
      .authenticateAs('dev_kean1401', 'Thienthan1@3c')
      .withWillTopic('willtopic')
      .withWillMessage('Will message')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  print('EMQ X Cloud client connecting');
  client.connectionMessage = connMessage;
  try {
    await client.connect();
  } catch (e) {
    print('Error: $e');
    client.disconnect();
  }
  return client;
}

// Callback function
// connection succeeded
void onConnected() {
  print('Connected');
}

// unconnected
void onDisconnected() {
  print('Disconnected');
}

// subscribe to topic succeeded
void onSubscribed(String topic) {
  print('Subscribed topic: $topic');
}

// subscribe to topic failed
void onSubscribeFail(String topic) {
  print('Failed to subscribe $topic');
}

// unsubscribe succeeded
void onUnsubscribed(String topic) {
  print('Unsubscribed topic: $topic');
}

// PING response received
void pong() {
  print('Ping response client callback invoked');
}

void subscribeTopic(MqttServerClient client, String topic) {
  client.subscribe(topic, MqttQos.atMostOnce);
  client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
    final MqttPublishMessage recMess = c[0].payload;
    final String payload =
    MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print("Got message: $payload");
});
}

void publishMessage(MqttServerClient client, String topic, String message) {
  final builder = MqttClientPayloadBuilder();
  builder.addString(message);
  client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload);
  print('Publish $topic: $message');
}


void prepareMqttClient(String topic) async {
  await connect().then((MqttServerClient client) {
    subscribeTopic(client, topic);
  });
}

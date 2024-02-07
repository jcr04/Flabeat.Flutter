import 'package:flutter/foundation.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothService {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  Future<bool> isBluetoothAvailable() async {
    bool isOn = await flutterBlue.isOn;
    bool isAvailable = await flutterBlue.isAvailable;
    return isOn && isAvailable;
  }

  void startScan() {
    flutterBlue.startScan(timeout: const Duration(seconds: 4));

    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        if (kDebugMode) {
          if (kDebugMode) {
            print('${result.device.name} found! rssi: ${result.rssi}');
          }
        }
      }
    });

    flutterBlue.stopScan();
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
  }

  Future<void> discoverServices(BluetoothDevice device) async {
    List<BluetoothService> services =
        (await device.discoverServices()).cast<BluetoothService>();
    // ignore: unused_local_variable
    for (var service in services) {}
  }

  void readDataFromDevice(BluetoothService service) {}

  void disconnectFromDevice(BluetoothDevice device) {
    device.disconnect();
  }

  void stopScan() {
    flutterBlue.stopScan();
  }
}

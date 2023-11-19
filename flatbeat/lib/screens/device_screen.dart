import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flatbeat/service/bluetooth_service.dart' as my_service;

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final my_service.BluetoothService _bluetoothService =
      my_service.BluetoothService();
  List<BluetoothDevice> _devices = [];
  bool _isScanning = false;
  bool _isConnecting = false;

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() async {
    if (await _bluetoothService.isBluetoothAvailable()) {
      setState(() => _isScanning = true);

      _bluetoothService.startScan();
      FlutterBlue.instance.scanResults.listen((results) {
        setState(() {
          _devices = results.map((r) => r.device).toList();
        });
      });

      await Future.delayed(const Duration(seconds: 4));
      _bluetoothService.stopScan();
      setState(() => _isScanning = false);
    }
  }

  void _connectToDevice(BluetoothDevice device) async {
    setState(() => _isConnecting = true);
    await _bluetoothService.connectToDevice(device);
    await _bluetoothService.discoverServices(device);
    // Aqui você pode fazer algo com os serviços descobertos
    setState(() => _isConnecting = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispositivos Bluetooth'),
        actions: [
          if (_isScanning || _isConnecting)
            const CircularProgressIndicator()
          else
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _startScan,
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_devices[index].name),
            subtitle: Text(_devices[index].id.toString()),
            onTap: () => _connectToDevice(_devices[index]),
          );
        },
      ),
    );
  }
}

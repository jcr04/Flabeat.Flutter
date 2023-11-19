import 'package:flutter/foundation.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothService {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  // Verificar se o Bluetooth está disponível e ligado
  Future<bool> isBluetoothAvailable() async {
    bool isOn = await flutterBlue.isOn;
    bool isAvailable = await flutterBlue.isAvailable;
    return isOn && isAvailable;
  }

  // Iniciar o escaneamento para encontrar dispositivos
  void startScan() {
    flutterBlue.startScan(timeout: const Duration(seconds: 4));

    flutterBlue.scanResults.listen((results) {
      for (ScanResult result in results) {
        // Aqui você pode filtrar os dispositivos pelo nome ou outros critérios
        if (kDebugMode) {
          if (kDebugMode) {
            print('${result.device.name} found! rssi: ${result.rssi}');
          }
        }
      }
    });

    // Pare o escaneamento quando terminar
    flutterBlue.stopScan();
  }

  // Conectar a um dispositivo
  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
  }

  // Descobrir serviços de um dispositivo conectado
  Future<void> discoverServices(BluetoothDevice device) async {
    List<BluetoothService> services =
        (await device.discoverServices()).cast<BluetoothService>();
    for (var service in services) {
      // Faz algo com cada serviço descoberto
    }
  }

  // Ler dados de um serviço específico
  // Implementação depende das especificações do serviço/dispositivo
  void readDataFromDevice(BluetoothService service) {
    // Implementar a lógica para ler dados do serviço
  }

  // Desconectar do dispositivo
  void disconnectFromDevice(BluetoothDevice device) {
    device.disconnect();
  }

  // Implemente mais métodos conforme necessário...
}

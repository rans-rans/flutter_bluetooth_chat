import 'package:all_bluetooth/all_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final allBluetooth = AllBluetooth();
  @override
  void initState() {
    super.initState();
    Future.wait([
      Permission.bluetooth.request(),
      Permission.bluetoothConnect.request(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: allBluetooth.streamBluetoothState,
        builder: (context, snapshot) {
          final bluetoothOn = snapshot.data ?? false;
          print(bluetoothOn);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Bluetooth Connect"),
            ),
            floatingActionButton: const FloatingActionButton(
              onPressed: null,
              backgroundColor: Colors.grey,
              child: Icon(Icons.wifi_tethering),
            ),
            body: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "off",
                        style: TextStyle(color: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: Text("Bonded Devices"),
                      ),
                    ],
                  ),
                  Center(
                    child: Text("Turn bluetooth on"),
                  )
                ],
              ),
            ),
          );
        });
  }
}

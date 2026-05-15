import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Card(
              child: ListTile(
                leading: const Icon(Icons.wifi),
                title: const Text("WiFi Status"),
                subtitle: const Text("Connected"),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.memory),
                title: const Text("Device"),
                subtitle: const Text("ESP32 Connected"),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text("About"),
                subtitle: const Text("Voltix Smart Energy System"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
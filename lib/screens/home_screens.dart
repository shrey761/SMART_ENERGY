import 'package:flutter/material.dart';
import '../widgets/data_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voltix"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.wifi),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 Summary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Energy Today",
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 8),
                  Text("5.6 kWh",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Status: Normal",
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Grid Data
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                DataCard(title: "Voltage", value: "230 V", icon: Icons.bolt),
                DataCard(title: "Current", value: "2.3 A", icon: Icons.flash_on),
                DataCard(title: "Power", value: "1.2 kW", icon: Icons.electric_meter),
                DataCard(title: "Energy", value: "5.6 kWh", icon: Icons.battery_charging_full),
              ],
            ),

            const SizedBox(height: 16),

            // 🔹 Prediction Card
            Card(
              child: ListTile(
                leading: const Icon(Icons.trending_up, color: Colors.red),
                title: const Text("Predicted Load"),
                subtitle: const Text("Next hour: 1.5 kW"),
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Suggestion Card
            Card(
              child: ListTile(
                leading: const Icon(Icons.warning, color: Colors.orange),
                title: const Text("High usage detected"),
                subtitle: const Text("Reduce load in Room 1"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
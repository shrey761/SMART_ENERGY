import 'package:flutter/material.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load Prediction"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔹 Main Prediction Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Predicted Load",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "1.8 kW",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Expected in next hour",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔹 Peak Alert
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.warning,
                  color: Colors.orange,
                ),
                title: const Text("Peak Alert"),
                subtitle: const Text(
                  "High demand expected at 7 PM",
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 Suggestions
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.lightbulb,
                  color: Colors.green,
                ),
                title: const Text("Optimization Suggestion"),
                subtitle: const Text(
                  "Shift heavy appliance usage to off-peak hours",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
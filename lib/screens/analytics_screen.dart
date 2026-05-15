import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytics"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // 🔹 Filter Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Daily"),
                ),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Weekly"),
                ),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Monthly"),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // 🔹 Graph Placeholder
            Container(
              height: 220,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(15),
              ),

              child: const Center(
                child: Text(
                  "Energy Usage Graph",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Statistics Card
            Card(
              child: ListTile(
                leading: const Icon(Icons.analytics),
                title: const Text("Peak Usage Time"),
                subtitle: const Text("7 PM"),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text("Average Usage"),
                subtitle: const Text("1.2 kW"),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.meeting_room),
                title: const Text("Room-wise Consumption"),
                subtitle: const Text("Room 1: 60% | Room 2: 40%"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
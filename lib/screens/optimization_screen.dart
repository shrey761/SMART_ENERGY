import 'package:flutter/material.dart';

class OptimizationScreen extends StatelessWidget {
  const OptimizationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(

        backgroundColor: Colors.black,
        elevation: 0,

        title: const Text(
          "Optimization Insights",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            // 🔥 Gruha Jyothi Optimization Card
            Container(

              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(

                color: const Color(0xFF1C1C1E),

                borderRadius: BorderRadius.circular(24),

                border: Border.all(
                  color: Colors.white10,
                ),
              ),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Row(

                    children: [

                      Icon(
                        Icons.energy_savings_leaf,
                        color: Colors.greenAccent,
                        size: 28,
                      ),

                      SizedBox(width: 10),

                      Text(
                        "Savings Potential",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Potential Monthly Savings",

                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "14 Units",

                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Estimated bill reduction by optimized usage",

                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(height: 24),

                  ClipRRect(

                    borderRadius: BorderRadius.circular(20),

                    child: LinearProgressIndicator(

                      value: 0.72,

                      minHeight: 12,

                      backgroundColor: Colors.white12,

                      valueColor: const AlwaysStoppedAnimation(
                        Colors.greenAccent,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "72% Optimization Efficiency",

                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 Smart Suggestions
            buildSuggestionCard(
              Icons.warning_amber_rounded,
              Colors.orange,
              "Room 1 contributes highest usage",
              "Reduce AC usage during afternoon peak hours",
            ),

            buildSuggestionCard(
              Icons.bolt,
              Colors.greenAccent,
              "Shift heavy loads to off-peak hours",
              "Recommended after 10 PM for better savings",
            ),

            buildSuggestionCard(
              Icons.lightbulb,
              Colors.blue,
              "Smart lighting optimization",
              "Turn off idle lights in Room 2",
            ),

            buildSuggestionCard(
              Icons.energy_savings_leaf,
              Colors.teal,
              "Stay within Gruha Jyothi limit",
              "Current usage trend may exceed allocation",
            ),

            const SizedBox(height: 20),

            // 🔥 Room-wise Consumption Summary
            Container(

              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(

                color: const Color(0xFF1C1C1E),

                borderRadius: BorderRadius.circular(24),

                border: Border.all(
                  color: Colors.white10,
                ),
              ),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Room-wise Consumption",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 22),

                  buildRoomRow(
                    "Room 1",
                    "42 Units",
                    Colors.red,
                  ),

                  buildRoomRow(
                    "Room 2",
                    "28 Units",
                    Colors.orange,
                  ),

                  buildRoomRow(
                    "Kitchen",
                    "18 Units",
                    Colors.blue,
                  ),

                  buildRoomRow(
                    "Hall",
                    "8 Units",
                    Colors.greenAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 Suggestion Card
  Widget buildSuggestionCard(
      IconData icon,
      Color color,
      String title,
      String subtitle,
      ) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 14),

      child: Card(

        color: const Color(0xFF1C1C1E),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),

        child: ListTile(

          leading: Icon(
            icon,
            color: color,
          ),

          title: Text(
            title,

            style: const TextStyle(
              color: Colors.white,
            ),
          ),

          subtitle: Text(
            subtitle,

            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  // 🔥 Room Summary Row
  Widget buildRoomRow(
      String room,
      String units,
      Color color,
      ) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 18),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Text(
            room,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),

          Container(

            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 7,
            ),

            decoration: BoxDecoration(

              color: color.withOpacity(0.15),

              borderRadius: BorderRadius.circular(20),
            ),

            child: Text(
              units,

              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
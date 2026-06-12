import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(

        backgroundColor: Colors.black,
        elevation: 0,

        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            // 🔥 Threshold Alert
            buildNotificationCard(

              icon: Icons.warning_amber_rounded,

              color: Colors.orange,

              title: "Approaching Free Unit Limit",

              subtitle:
              "You have consumed 88 out of 96 allocated units. "
                  "You may exceed the threshold within 3 days.",

              time: "5 min ago",
            ),

            // 🔥 Prediction Alert
            buildNotificationCard(

              icon: Icons.trending_up,

              color: Colors.redAccent,

              title: "Predicted Limit Exceed",

              subtitle:
              "Predicted month-end usage is 108 units. "
                  "Additional electricity charges may apply.",

              time: "20 min ago",
            ),

            // 🔥 Room Load Alert
            buildNotificationCard(

              icon: Icons.bolt,

              color: Colors.yellow,

              title: "High Load Detected in Room 1",

              subtitle:
              "Room 1 currently contributes 42% of total power usage. "
                  "Load balancing is recommended.",

              time: "35 min ago",
            ),

            // 🔥 Optimization Alert
            buildNotificationCard(

              icon: Icons.energy_savings_leaf,

              color: Colors.greenAccent,

              title: "Optimization Suggestion",

              subtitle:
              "Shift heavy appliance usage to off-peak hours "
                  "to reduce energy consumption.",

              time: "1 hour ago",
            ),

            // 🔥 Peak Hour Alert
            buildNotificationCard(

              icon: Icons.access_time,

              color: Colors.blue,

              title: "Peak Usage Hour Detected",

              subtitle:
              "Maximum energy consumption observed between "
                  "7 PM and 9 PM.",

              time: "2 hours ago",
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 Notification Card
  Widget buildNotificationCard({

    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required String time,

  }) {

    return Container(

      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: const Color(0xFF1C1C1E),

        borderRadius: BorderRadius.circular(22),

        border: Border.all(
          color: Colors.white10,
        ),
      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(

            children: [

              Container(

                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(

                  color: color.withOpacity(0.15),

                  shape: BoxShape.circle,
                ),

                child: Icon(
                  icon,
                  color: color,
                  size: 26,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(

                child: Text(
                  title,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            subtitle,

            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            time,

            style: const TextStyle(
              color: Colors.white38,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/data_card.dart';
import '../screens/analytics_screen.dart';
import 'prediction_screen.dart';
import 'optimization_screen.dart';
import 'notification_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(

        backgroundColor: Colors.black,
        elevation: 0,

        title: const Text(
          "Voltix",
          style: TextStyle(
            color: Colors.white,
          ),
        ),

        actions: [
          IconButton(

            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
          // 🔥 Analytics Icon
          IconButton(

            icon: const Icon(
              Icons.insights,
              color: Colors.white,
            ),

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(
                  builder: (context) => const AnalyticsScreen(),
                ),
              );
            },
          ),

          // 🔥 WiFi Icon
          const Padding(

            padding: EdgeInsets.only(right: 12),

            child: Icon(
              Icons.wifi,
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            // 🔥 Gruha Jyothi Status Card
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
                        "Gruha Jyothi Status",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 🔥 Allocation Row
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      buildStatusColumn(
                        "Allocated",
                        "96 Units",
                        Colors.blue,
                      ),

                      buildStatusColumn(
                        "Used",
                        "72 Units",
                        Colors.orange,
                      ),

                      buildStatusColumn(
                        "Remaining",
                        "24 Units",
                        Colors.greenAccent,
                      ),
                    ],
                  ),

                  const SizedBox(height: 26),

                  // 🔥 Progress Bar
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      const Text(
                        "Monthly Usage",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 10),

                      ClipRRect(

                        borderRadius: BorderRadius.circular(20),

                        child: LinearProgressIndicator(

                          value: 0.75,

                          minHeight: 12,

                          backgroundColor: Colors.white12,

                          valueColor: const AlwaysStoppedAnimation(
                            Colors.orange,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "72 / 96 Units Used",

                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔥 Warning Card
                  Container(

                    padding: const EdgeInsets.all(14),

                    decoration: BoxDecoration(

                      color: Colors.orange.withOpacity(0.12),

                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: const Row(

                      children: [

                        Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.orange,
                        ),

                        SizedBox(width: 10),

                        Expanded(

                          child: Text(
                            "At current usage rate, free unit limit may be exceeded within 6 days.",

                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Grid Data
            GridView.count(

              crossAxisCount: 2,
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              crossAxisSpacing: 10,
              mainAxisSpacing: 10,

              children: const [

                DataCard(
                  title: "Voltage",
                  value: "230 V",
                  icon: Icons.bolt,
                ),

                DataCard(
                  title: "Current",
                  value: "2.3 A",
                  icon: Icons.flash_on,
                ),

                DataCard(
                  title: "Power",
                  value: "1.2 kW",
                  icon: Icons.electric_meter,
                ),

                DataCard(
                  title: "Energy",
                  value: "5.6 kWh",
                  icon: Icons.battery_charging_full,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔮 Prediction Card
            GestureDetector(

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(
                    builder: (context) => const PredictionScreen(),
                  ),
                );
              },

              child: Card(

                color: const Color(0xFF1C1C1E),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),

                child: const ListTile(

                  leading: Icon(
                    Icons.trending_up,
                    color: Colors.red,
                  ),

                  title: Text(
                    "Predicted Usage",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                  subtitle: Text(
                    "Predicted month-end usage : 108 Units",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white38,
                    size: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ⚡ Optimization Card
            GestureDetector(

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(
                    builder: (context) => const OptimizationScreen(),
                  ),
                );
              },

              child: Card(

                color: const Color(0xFF1C1C1E),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),

                child: const ListTile(

                  leading: Icon(
                    Icons.warning,
                    color: Colors.orange,
                  ),

                  title: Text(
                    "Optimization Suggestions",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                  subtitle: Text(
                    "Reduce Room 1 consumption",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white38,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 STATUS COLUMN
  Widget buildStatusColumn(
      String title,
      String value,
      Color color,
      ) {

    return Column(

      children: [

        Text(
          title,

          style: const TextStyle(
            color: Colors.white54,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          value,

          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
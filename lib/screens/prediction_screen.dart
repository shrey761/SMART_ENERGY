import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(

        backgroundColor: Colors.black,
        elevation: 0,

        title: const Text(
          "Prediction Insights",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            // 🔥 Overall Prediction Card
            Container(

              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: const Color(0xFF1C1C1E),

                borderRadius: BorderRadius.circular(24),
              ),

              child: const Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    "Predicted Total Load",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "3.8 kWh",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "Expected for next 24 hours",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 Room Predictions
            Row(

              children: [

                Expanded(
                  child: buildRoomCard(
                    "Room 1",
                    "2.1 kWh",
                    Colors.orange,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: buildRoomCard(
                    "Room 2",
                    "1.7 kWh",
                    Colors.blue,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔥 Consumption Graph
            Container(

              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Predicted Consumption",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(

                    height: 220,

                    child: BarChart(

                      BarChartData(

                        alignment: BarChartAlignment.spaceAround,

                        maxY: 4,

                        borderData: FlBorderData(show: false),

                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,

                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: Colors.white10,
                              strokeWidth: 1,
                            );
                          },
                        ),

                        titlesData: FlTitlesData(

                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),

                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),

                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),

                          bottomTitles: AxisTitles(

                            sideTitles: SideTitles(

                              showTitles: true,

                              getTitlesWidget: (value, meta) {

                                const rooms = [
                                  'R1',
                                  'R2'
                                ];

                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),

                                  child: Text(
                                    rooms[value.toInt()],
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        barGroups: [

                          makeBar(0, 2.1, Colors.orange),
                          makeBar(1, 1.7, Colors.blue),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 Insights Card
            Container(

              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(24),
              ),

              child: const Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    "Prediction Insights",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  ListTile(
                    leading: Icon(
                      Icons.warning,
                      color: Colors.orange,
                    ),

                    title: Text(
                      "Room 1 may consume more power",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.bolt,
                      color: Colors.green,
                    ),

                    title: Text(
                      "Energy usage expected to increase at night",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 ROOM CARD
  Widget buildRoomCard(
      String room,
      String value,
      Color color,
      ) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(

        children: [

          Text(
            room,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Predicted Usage",
            style: TextStyle(
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 BAR FUNCTION
  BarChartGroupData makeBar(
      int x,
      double y,
      Color color,
      ) {

    return BarChartGroupData(

      x: x,

      barRods: [

        BarChartRodData(
          toY: y,

          width: 28,

          borderRadius: BorderRadius.circular(8),

          color: color,
        ),
      ],
    );
  }
}
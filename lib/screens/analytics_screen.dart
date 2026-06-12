import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,

        title: const Text(
          "Weekly Analytics",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            // 🔥 Weekly Report Card
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
                    "Weekly Energy Report",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "32.5 kWh",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    "Total weekly energy consumption",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    height: 220,

                    child: BarChart(

                      BarChartData(

                        alignment: BarChartAlignment.spaceAround,

                        maxY: 10,

                        borderData: FlBorderData(show: false),

                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,

                          horizontalInterval: 2,

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

                                const days = [
                                  'M',
                                  'T',
                                  'W',
                                  'T',
                                  'F',
                                  'S',
                                  'S'
                                ];

                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),

                                  child: Text(
                                    days[value.toInt()],
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

                          makeBar(0, 4),
                          makeBar(1, 5),
                          makeBar(2, 3),
                          makeBar(3, 8),
                          makeBar(4, 4),
                          makeBar(5, 7),
                          makeBar(6, 5),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 Peak Usage Time Heatmap
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
                    "Peak Usage Times",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  buildPeakRow("Room 1"),
                  buildPeakRow("Room 2"),
                  buildPeakRow("Kitchen"),
                  buildPeakRow("Hall"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 BAR FUNCTION
  BarChartGroupData makeBar(int x, double y) {

    return BarChartGroupData(
      x: x,

      barRods: [

        BarChartRodData(
          toY: y,
          width: 22,

          borderRadius: BorderRadius.circular(8),

          color: Colors.orange,
        ),
      ],
    );
  }

  // 🔥 PEAK ROW
  Widget buildPeakRow(String room) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 14),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            room,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: List.generate(

              12,

                  (index) => Expanded(

                child: Container(

                  margin: const EdgeInsets.symmetric(horizontal: 2),

                  height: 18,

                  decoration: BoxDecoration(

                    color: index % 3 == 0
                        ? Colors.orange
                        : Colors.orange.withOpacity(0.2),

                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
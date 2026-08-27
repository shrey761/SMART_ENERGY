import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../widgets/data_card.dart';
import '../screens/analytics_screen.dart';
import 'prediction_screen.dart';
import 'optimization_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ============================================================
  // FIREBASE
  // ============================================================

  static final DatabaseReference readingsRef =
  FirebaseDatabase.instance
      .ref()
      .child('sensor_logs')
      .child('esp32_01')
      .child('readings');

  // Gruha Jyothi allocation
  static const double allocatedUnits = 96.0;

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
          // Notifications
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

          // Analytics
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

          // WiFi
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.wifi,
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: StreamBuilder<DatabaseEvent>(
        stream: readingsRef
            .orderByKey()
            .limitToLast(1)
            .onValue,

        builder: (context, snapshot) {

          // ======================================================
          // LOADING
          // ======================================================

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }

          // ======================================================
          // ERROR
          // ======================================================

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Firebase error:\n${snapshot.error}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }

          // ======================================================
          // NO DATA
          // ======================================================

          if (!snapshot.hasData ||
              snapshot.data!.snapshot.value == null) {
            return const Center(
              child: Text(
                "Waiting for ESP32 data...",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            );
          }

          // ======================================================
          // GET LATEST READING
          // ======================================================

          final rawData = snapshot.data!.snapshot.value;

          if (rawData is! Map) {
            return const Center(
              child: Text(
                "Invalid Firebase data",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }

          final readingsMap = Map<dynamic, dynamic>.from(rawData);

          if (readingsMap.isEmpty) {
            return const Center(
              child: Text(
                "No readings available",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            );
          }

          // Latest reading
          final latestKey = readingsMap.keys.first;

          final latestRaw = readingsMap[latestKey];

          if (latestRaw is! Map) {
            return const Center(
              child: Text(
                "Invalid reading format",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }

          final data = Map<dynamic, dynamic>.from(latestRaw);

          // ======================================================
          // READ FIREBASE VALUES
          // ======================================================

          final double voltage1 =
          toDouble(data['voltage1']);

          final double voltage2 =
          toDouble(data['voltage2']);

          final double current1 =
          toDouble(data['current1']);

          final double current2 =
          toDouble(data['current2']);

          final double power1 =
          toDouble(data['power1']);

          final double power2 =
          toDouble(data['power2']);

          final double totalPower =
          data.containsKey('totalPower')
              ? toDouble(data['totalPower'])
              : power1 + power2;

          final double totalEnergy =
          data.containsKey('totalEnergy')
              ? toDouble(data['totalEnergy'])
              : toDouble(data['energy1']) +
              toDouble(data['energy2']);

          // ======================================================
          // CURRENT TOTAL
          // ======================================================

          final double totalCurrent =
          data.containsKey('totalCurrent')
              ? toDouble(data['totalCurrent'])
              : current1 + current2;

          // ======================================================
          // MONTHLY GRUHA JYOTHI
          // ======================================================

          // For now, totalEnergy is used as the consumed units.
          //
          // 1 kWh = 1 electricity unit.
          //
          // Later we can add a monthly baseline in Firebase so
          // the value resets automatically after electricity bill
          // payment.

          final double usedUnits = totalEnergy;

          double remainingUnits =
              allocatedUnits - usedUnits;

          if (remainingUnits < 0) {
            remainingUnits = 0;
          }

          double usagePercentage =
              usedUnits / allocatedUnits;

          if (usagePercentage < 0) {
            usagePercentage = 0;
          }

          if (usagePercentage > 1) {
            usagePercentage = 1;
          }

          // ======================================================
          // WARNING
          // ======================================================

          String warningMessage;

          if (usedUnits >= allocatedUnits) {
            warningMessage =
            "Your free unit limit has been exceeded.";
          } else if (usagePercentage >= 0.90) {
            warningMessage =
            "Warning: 90% of your free units have been used.";
          } else {
            warningMessage =
            "Your electricity usage is within the free unit limit.";
          }

          // ======================================================
          // UI
          // ======================================================

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [

                // ==================================================
                // GRUHA JYOTHI CARD
                // ==================================================

                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),

                    borderRadius:
                    BorderRadius.circular(24),

                    border: Border.all(
                      color: Colors.white10,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      // TITLE
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
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // ALLOCATION
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [

                          buildStatusColumn(
                            "Allocated",
                            "${allocatedUnits.toStringAsFixed(0)} Units",
                            Colors.blue,
                          ),

                          buildStatusColumn(
                            "Used",
                            "${usedUnits.toStringAsFixed(2)} Units",
                            Colors.orange,
                          ),

                          buildStatusColumn(
                            "Remaining",
                            "${remainingUnits.toStringAsFixed(2)} Units",
                            Colors.greenAccent,
                          ),
                        ],
                      ),

                      const SizedBox(height: 26),

                      // MONTHLY USAGE
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          const Text(
                            "Monthly Usage",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),

                          const SizedBox(height: 10),

                          ClipRRect(
                            borderRadius:
                            BorderRadius.circular(20),

                            child:
                            LinearProgressIndicator(
                              value: usagePercentage,

                              minHeight: 12,

                              backgroundColor:
                              Colors.white12,

                              valueColor:
                              AlwaysStoppedAnimation(
                                usagePercentage >= 0.90
                                    ? Colors.red
                                    : Colors.orange,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "${usedUnits.toStringAsFixed(2)} / "
                                "${allocatedUnits.toStringAsFixed(0)} Units Used",

                            style: const TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // WARNING
                      Container(
                        padding:
                        const EdgeInsets.all(14),

                        decoration: BoxDecoration(
                          color: usagePercentage >= 0.90
                              ? Colors.red.withOpacity(0.15)
                              : Colors.orange.withOpacity(0.12),

                          borderRadius:
                          BorderRadius.circular(16),
                        ),

                        child: Row(
                          children: [

                            Icon(
                              usagePercentage >= 0.90
                                  ? Icons.error_outline
                                  : Icons.warning_amber_rounded,

                              color:
                              usagePercentage >= 0.90
                                  ? Colors.red
                                  : Colors.orange,
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                warningMessage,

                                style: const TextStyle(
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

                // ==================================================
                // SENSOR DATA
                // ==================================================

                GridView.count(
                  crossAxisCount: 2,

                  shrinkWrap: true,

                  physics:
                  const NeverScrollableScrollPhysics(),

                  crossAxisSpacing: 10,

                  mainAxisSpacing: 10,

                  children: [

                    DataCard(
                      title: "Voltage",
                      value:
                      "${voltage1.toStringAsFixed(1)} V",
                      icon: Icons.bolt,
                    ),

                    DataCard(
                      title: "Current",
                      value:
                      "${totalCurrent.toStringAsFixed(2)} A",
                      icon: Icons.flash_on,
                    ),

                    DataCard(
                      title: "Power",
                      value:
                      "${(totalPower / 1000).toStringAsFixed(2)} kW",
                      icon: Icons.electric_meter,
                    ),

                    DataCard(
                      title: "Energy",
                      value:
                      "${totalEnergy.toStringAsFixed(4)} kWh",
                      icon: Icons.battery_charging_full,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ==================================================
                // PREDICTION
                // ==================================================

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const PredictionScreen(),
                      ),
                    );
                  },

                  child: Card(
                    color:
                    const Color(0xFF1C1C1E),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(18),
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
                        "ML prediction will appear here",
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

                // ==================================================
                // OPTIMIZATION
                // ==================================================

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const OptimizationScreen(),
                      ),
                    );
                  },

                  child: Card(
                    color:
                    const Color(0xFF1C1C1E),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(18),
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
                        "Based on current consumption",
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

                const SizedBox(height: 20),

                // Latest reading indicator
                Text(
                  "Live data from ESP32 • Firebase",
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // STATUS COLUMN
  // ============================================================

  static Widget buildStatusColumn(
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
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CONVERT FIREBASE VALUE TO DOUBLE
  // ============================================================

  static double toDouble(dynamic value) {
    if (value == null) {
      return 0.0;
    }

    if (value is num) {
      return value.toDouble();
    }

    return double.tryParse(value.toString()) ?? 0.0;
  }
}
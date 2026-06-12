import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;

  const DataCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(

        color: const Color(0xFF1C1C1E),

        borderRadius: BorderRadius.circular(22),

        border: Border.all(
          color: Colors.white10,
          width: 1,
        ),

        boxShadow: [

          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(

              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(

                color: Colors.orange.withOpacity(0.15),

                shape: BoxShape.circle,
              ),

              child: Icon(
                icon,
                size: 28,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              title,

              style: const TextStyle(
                color: Colors.white60,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              value,

              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
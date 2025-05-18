import 'package:flutter/material.dart';

class ChartSection extends StatelessWidget {
  final String titleLeft;
  final String valueLeft;
  final String valueRight;
  final String percentChange;
  final double chartHeight;

  const ChartSection({
    super.key,
    required this.titleLeft,
    required this.valueLeft,
    required this.valueRight,
    required this.percentChange,
    required this.chartHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color(0xFF212121), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row (titres + %)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleLeft,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)),
                  Text(valueLeft,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Courier')),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(percentChange,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.lightBlueAccent)),
                  Text(valueRight,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Courier')),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),

          // Placeholder pour le graphique
          Container(
            height: chartHeight,
            decoration: BoxDecoration(
              color: const Color(0xFF121F2B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Graph here',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}

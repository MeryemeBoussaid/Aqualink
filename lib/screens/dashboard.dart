import 'package:flutter/material.dart';
import '../widgets/data_card.dart';
import '../widgets/chart_section.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedPeriodIndex = 0;
  int selectedNavIndex = 0;
  final List<String> periods = ['1D', '1W', '4W', '2M', '4M', '6M'];

  @override
  Widget build(BuildContext context) {
    final gradientColors = [const Color(0xFF69C6D9), const Color(0xFF3B8A9E)];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Water Data',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Courier',
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Les 3 cartes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DataCard(title: 'Money\nsaved', value: '380', unit: 'DH', gradientColors: gradientColors),
                DataCard(title: 'Total\nConsumption', value: '400', unit: 'L', gradientColors: gradientColors),
                DataCard(title: 'Water\nSaved', value: '41', unit: 'L', gradientColors: gradientColors),
              ],
            ),
            const SizedBox(height: 20),

            // Période + Doing
            Row(
              children: const [
                Text('Periode', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Courier')),
                Spacer(),
                Text('Doing', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 10),

            // Sélecteur de période
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: periods.length,
                separatorBuilder: (_, __) => const VerticalDivider(color: Colors.grey, thickness: 1, width: 20),
                itemBuilder: (context, index) {
                  final isSelected = selectedPeriodIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedPeriodIndex = index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blueAccent : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        periods[index],
                        style: TextStyle(color: isSelected ? Colors.white : Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Sections graphiques et données
            Expanded(
              child: ListView(
                children: const [
                  ChartSection(
                    titleLeft: 'AVG. DAILY USAGE',
                    valueLeft: '40L',
                    valueRight: '35.2L',
                    percentChange: '+6.2%',
                    chartHeight: 120,
                  ),
                  SizedBox(height: 20),
                  ChartSection(
                    titleLeft: 'DOLOREM IPSU',
                    valueLeft: '47DH',
                    valueRight: '55.2DH',
                    percentChange: '+3.6%',
                    chartHeight: 120,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Barre de navigation en bas
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedNavIndex,
        onTap: (index) => setState(() => selectedNavIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

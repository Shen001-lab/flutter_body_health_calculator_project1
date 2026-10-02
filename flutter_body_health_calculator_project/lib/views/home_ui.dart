import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'about_ui.dart';
import 'bmi_ui.dart';
import 'bmr_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  // เริ่มต้นที่หน้า About (ปุ่มกลาง)
  int _currentIndex = 1;

  final List<Widget> _pages = const [
    BmiUI(),
    AboutUI(),
    BmrUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Body Health Calculator',
          style: GoogleFonts.kanit(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFD84315),
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFE04000),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.kanit(fontSize: 12),
        unselectedLabelStyle: GoogleFonts.kanit(fontSize: 12),
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight_outlined),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'BMR',
          ),
        ],
      ),
    );
  }
}

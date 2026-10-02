import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFCF4FA),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(flex: 3),
            Text(
              'Body Health Calculator',
              style: GoogleFonts.kanit(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF5722),
              ),
            ),
            const SizedBox(height: 24),
            Image.asset(
              'assets/images/calculate.png',
              width: 130,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.calculate,
                size: 110,
                color: Color(0xFFD84315),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'คำนวณค่าดัชนีมวลกาย (BMI)\nคำนวณพลังงานที่ร่างกายต้องการ (BMR)',
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(
                fontSize: 14,
                color: const Color(0xFFD84315),
              ),
            ),
            const Spacer(flex: 4),
            Image.asset(
              'assets/images/saulogo.png',
              width: 50,
              errorBuilder: (_, __, ___) => Icon(
                Icons.verified_user_outlined,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '© 2026 SAU. All rights reserved.\nCreated by SAU Software Development Team',
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(fontSize: 10, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

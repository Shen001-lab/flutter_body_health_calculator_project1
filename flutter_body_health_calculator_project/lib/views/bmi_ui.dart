import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiUI extends StatefulWidget {
  const BmiUI({super.key});

  @override
  State<BmiUI> createState() => _BmiUIState();
}

class _BmiUIState extends State<BmiUI> {
  final _weightCtrl = TextEditingController();
  final _heightCtrl = TextEditingController();

  double _bmi = 0.0;
  String _result = 'การแปลผล';
  Color _resultColor = const Color(0xFFC8E6C9);

  @override
  void dispose() {
    _weightCtrl.dispose();
    _heightCtrl.dispose();
    super.dispose();
  }

  void _showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg, style: GoogleFonts.kanit())),
    );
  }

  void _calculate() {
    final weight = double.tryParse(_weightCtrl.text.trim());
    final heightCm = double.tryParse(_heightCtrl.text.trim());

    if (weight == null || heightCm == null || weight <= 0 || heightCm <= 0) {
      _showMsg('กรุณากรอกน้ำหนักและส่วนสูงให้ถูกต้อง');
      return;
    }

    final heightM = heightCm / 100;
    final bmi = weight / (heightM * heightM);

    String result;
    Color color;
    if (bmi < 18.5) {
      result = 'น้ำหนักต่ำกว่าเกณฑ์';
      color = const Color(0xFFBBDEFB);
    } else if (bmi < 23.0) {
      result = 'น้ำหนักสมส่วน';
      color = const Color(0xFFC8E6C9);
    } else if (bmi < 25.0) {
      result = 'น้ำหนักเกิน';
      color = const Color(0xFFFFF9C4);
    } else if (bmi < 30.0) {
      result = 'โรคอ้วนระดับ 1';
      color = const Color(0xFFFFE0B2);
    } else {
      result = 'โรคอ้วนระดับ 2 หรืออ้วนมาก';
      color = const Color(0xFFFFCDD2);
    }

    setState(() {
      _bmi = bmi;
      _result = result;
      _resultColor = color;
    });
  }

  void _clear() {
    setState(() {
      _weightCtrl.clear();
      _heightCtrl.clear();
      _bmi = 0.0;
      _result = 'การแปลผล';
      _resultColor = const Color(0xFFC8E6C9);
    });
  }

  InputDecoration _decoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.kanit(fontSize: 12, color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFCF4FA),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                style: GoogleFonts.kanit(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFD84315),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/bmi.png',
                width: 140,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.speed,
                  size: 120,
                  color: Color(0xFFD84315),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('น้ำหนัก (kg)', style: GoogleFonts.kanit(fontSize: 13)),
            const SizedBox(height: 6),
            TextField(
              controller: _weightCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: _decoration('กรอกน้ำหนักของคุณ'),
            ),
            const SizedBox(height: 14),
            Text('ส่วนสูง (เซนติเมตร)', style: GoogleFonts.kanit(fontSize: 13)),
            const SizedBox(height: 6),
            TextField(
              controller: _heightCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: _decoration('กรอกส่วนสูงของคุณ'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: _calculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5722),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text('คำนวณ BMI', style: GoogleFonts.kanit(fontSize: 14)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: _clear,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text('ล้างข้อมูล', style: GoogleFonts.kanit(fontSize: 14)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: _resultColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Text('BMI', style: GoogleFonts.kanit(fontSize: 13)),
                  Text(
                    _bmi.toStringAsFixed(2),
                    style: GoogleFonts.kanit(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    _result,
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
}

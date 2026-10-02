import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({super.key});

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
  final _weightCtrl = TextEditingController();
  final _heightCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();

  String _gender = 'ชาย';
  double _bmr = 0.0;

  @override
  void dispose() {
    _weightCtrl.dispose();
    _heightCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  void _showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg, style: GoogleFonts.kanit())),
    );
  }

  void _calculate() {
    final weight = double.tryParse(_weightCtrl.text.trim());
    final height = double.tryParse(_heightCtrl.text.trim());
    final age = double.tryParse(_ageCtrl.text.trim());

    if (weight == null ||
        height == null ||
        age == null ||
        weight <= 0 ||
        height <= 0 ||
        age <= 0) {
      _showMsg('กรุณากรอกน้ำหนัก ส่วนสูง และอายุให้ถูกต้อง');
      return;
    }

    double bmr;
    if (_gender == 'ชาย') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    setState(() => _bmr = bmr);
  }

  void _clear() {
    setState(() {
      _weightCtrl.clear();
      _heightCtrl.clear();
      _ageCtrl.clear();
      _gender = 'ชาย';
      _bmr = 0.0;
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

  Widget _genderButton(String label) {
    final selected = _gender == label;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: ElevatedButton(
          onPressed: () => setState(() => _gender = label),
          style: ElevatedButton.styleFrom(
            backgroundColor: selected ? const Color(0xFFBBDEFB) : Colors.white,
            foregroundColor: Colors.black87,
            elevation: selected ? 1 : 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Text(label, style: GoogleFonts.kanit(fontSize: 13)),
        ),
      ),
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
                'คำนวณหาอัตราการเผาผลาญที่\nร่างกายต้องการ (BMR)',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFD84315),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/images/bmr.png',
                width: 140,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.favorite,
                  size: 120,
                  color: Color(0xFFD84315),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('เพศ', style: GoogleFonts.kanit(fontSize: 13)),
            const SizedBox(height: 6),
            Row(
              children: [
                _genderButton('ชาย'),
                _genderButton('หญิง'),
              ],
            ),
            const SizedBox(height: 14),
            Text('น้ำหนัก (กิโลกรัม)', style: GoogleFonts.kanit(fontSize: 13)),
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
            const SizedBox(height: 14),
            Text('อายุ (ปี)', style: GoogleFonts.kanit(fontSize: 13)),
            const SizedBox(height: 6),
            TextField(
              controller: _ageCtrl,
              keyboardType: TextInputType.number,
              decoration: _decoration('กรอกอายุของคุณ'),
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
                child: Text('คำนวณ BMR', style: GoogleFonts.kanit(fontSize: 14)),
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
                color: const Color(0xFFC8E6C9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Text('BMR', style: GoogleFonts.kanit(fontSize: 13)),
                  Text(
                    _bmr.toStringAsFixed(2),
                    style: GoogleFonts.kanit(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'kcal / day',
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

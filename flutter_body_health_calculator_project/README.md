# flutter_body_health_calculator_project (Body ว้าว)

## วิธีติดตั้ง
1. เปิดเทอร์มินัลใน VS Code ที่โฟลเดอร์นี้
2. ถ้ายังไม่มีโฟลเดอร์ android/ios ให้รัน:  flutter create .
   (คำสั่งนี้จะเติมโฟลเดอร์แพลตฟอร์มโดยไม่ลบโค้ดใน lib/)
3. flutter pub get
4. เลือก Device เป็น iPhone 15 Pro Max (iOS Simulator) แล้วรัน: flutter run

## รูปภาพ (ใส่ในโฟลเดอร์ assets/images/)
- logo.png  (ใช้ใน Splash และ About)
- bmi.png   (หน้า BMI)
- bmr.png   (หน้า BMR)
ถ้ายังไม่ใส่รูป แอปจะแสดงไอคอนแทนอัตโนมัติ

## ตั้งชื่อแอปเป็น "Body ว้าว"
- Android: android/app/src/main/AndroidManifest.xml -> android:label="Body ว้าว"
- iOS: ios/Runner/Info.plist -> CFBundleDisplayName = Body ว้าว

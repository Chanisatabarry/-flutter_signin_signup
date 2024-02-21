import 'package:flutter/material.dart';
import 'package:onboarding_screen/screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/home_screen.dart';

bool show = true; //)ประกาศเป็นตัวแปรโชว์

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ??
      true; //ถ้าไม่ใช่หน้าสุดท้ายให้รันต่อ ถ้าใช่น่าสุดท้ายจะเด้งไปหน้าเว็บเลย
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // home: IntroScreen(),
      home: show
          ? IntroScreen()
          : HomeScreen(), //คำสั่งif ในรูปย่อ ifถ้าจริงไปหน้า IntroScreen() else ถ้าไม่ใช่ไปหน้า HomeScreen()
    );
  }
}
